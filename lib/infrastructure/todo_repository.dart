import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:todo/domain/todo/todo_item/todo_item.dart';
import 'package:todo/infrastructure/dto/todo_dto.dart';

/// main.dartでoverrideを行います。
///
/// Isar.open関数はFutureのため、main.dartにて初期化しています。
final todoIsarProvider = Provider<Isar>((ref) => throw UnimplementedError());

final todoRepositoryProvider =
    Provider((ref) => TodoRepository(ref.watch(todoIsarProvider)));

class TodoRepository {
  TodoRepository(this.isar);
  final Isar isar;

  Future<List<TodoItem>> fetchTodoList() async {
    final todoDtoCollection = isar.todoDtos;
    final todoDtos = await todoDtoCollection
        .where()
        .isDeletedEqualTo(false)
        .limit(20)
        .findAll();

    return todoDtos.map((dto) => dto.toDomain()).toList();
  }

  Future<List<TodoItem>> fetchDeletedTodoList() async {
    final todoDtoCollection = isar.todoDtos;
    final todoDtos =
        await todoDtoCollection.where().isDeletedEqualTo(true).findAll();

    return todoDtos.map((dto) => dto.toDomain()).toList();
  }

  Future<TodoItem> add(TodoDto dto) async {
    final todoDtoCollection = isar.todoDtos;
    final todoItem = await isar.writeTxn(() async {
      final id = await todoDtoCollection.put(dto);
      final todoItem = (await todoDtoCollection.get(id))!.toDomain();

      return todoItem;
    });

    return todoItem;
  }

  Future<void> edit(TodoItem item) async {
    final todoDtoCollection = isar.todoDtos;
    await isar.writeTxn(() => todoDtoCollection.put(TodoDto.fromDomain(item)));

    return;
  }

  Future<void> deleteAll(List<TodoItem> todoList) async {
    final todoDtoCollection = isar.todoDtos;
    await isar.writeTxn(() =>
        todoDtoCollection.deleteAll(todoList.map((item) => item.id).toList()));

    return;
  }
}
