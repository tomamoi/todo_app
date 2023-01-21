import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:todo/features/todo/domain/todo_domain_importer.dart';
import 'package:todo/features/todo/infrastructure/dto/todo_dto.dart';

/// main.dartでoverrideを行います。
///
/// Isar.open関数はFutureのため、main.dartにて初期化しています。
final todoIsarProvider = Provider<Isar>((ref) => throw UnimplementedError());

/// RepositoryProviderはUsecase層内のみで使用すること。
final todoRepositoryProvider =
    Provider((ref) => TodoRepository(ref.watch(todoIsarProvider)));

/// isarのクエリについては
/// https://isar.dev/ja/queries.html
/// を参照してください。

class TodoRepository {
  TodoRepository(this._isar);
  final Isar _isar;

  /// page：取得するメモの個数
  ///
  /// offset：取得開始位置の指定（ページングに使用）
  ///
  /// [TodoList]のlengthがoffsetとなります。
  Future<List<TodoItem>> fetchTodos(int page, int offset) async {
    final todoDtoCollection = _isar.todoDtos;
    final todoDtos = await todoDtoCollection
        .where(sort: Sort.desc)
        .anyUpdatedAt()
        .filter()
        .isGarbageEqualTo(false)
        .offset(offset)
        .limit(page)
        .findAll();

    return todoDtos.map((dto) => dto.toDomain()).toList();
  }

  Future<List<TodoItem>> fetchGarbageTodos() async {
    final todoDtoCollection = _isar.todoDtos;
    final todoDtos = await todoDtoCollection
        .where(sort: Sort.desc)
        .anyUpdatedAt()
        .filter()
        .isGarbageEqualTo(true)
        .findAll();

    return todoDtos.map((dto) => dto.toDomain()).toList();
  }

  Future<TodoItem> add(TodoDto dto) async {
    final todoDtoCollection = _isar.todoDtos;

    // WriteとReadをトランザクション内にて行っています。
    final todoItem = await _isar.writeTxn(() async {
      final id = await todoDtoCollection.put(dto);
      final todoItem = (await todoDtoCollection.get(id))!.toDomain();

      return todoItem;
    });

    return todoItem;
  }

  Future<void> edit(TodoItem item) async {
    final todoDtoCollection = _isar.todoDtos;
    await _isar.writeTxn(() => todoDtoCollection.put(TodoDto.fromDomain(item)));

    return;
  }

  Future<List<TodoItem>> fetchTodoListScheduledToDelete() async {
    final todoDtoCollection = _isar.todoDtos;
    final todoDtos = await todoDtoCollection
        .where()
        .updatedAtLessThan(DateTime.now().subtract(const Duration(days: 90)))
        .filter()
        .isGarbageEqualTo(true)
        .findAll();

    return todoDtos.map((dto) => dto.toDomain()).toList();
  }

  Future<void> deleteAll(List<TodoItem> todoList) async {
    final todoDtoCollection = _isar.todoDtos;
    await _isar.writeTxn(() =>
        todoDtoCollection.deleteAll(todoList.map((item) => item.id).toList()));

    return;
  }
}
