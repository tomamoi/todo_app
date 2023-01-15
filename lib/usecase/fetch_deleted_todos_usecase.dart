import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:todo/domain/todo/todo_item/todo_item.dart';
import 'package:todo/infrastructure/todo_repository.dart';

final fetchDeletedTodosUsecaseProvider =
    Provider.autoDispose<FetchDeletedTodosUsecase>((ref) {
  return FetchDeletedTodosUsecase(ref.watch(todoRepositoryProvider));
});

class FetchDeletedTodosUsecase {
  FetchDeletedTodosUsecase(this._repository);
  final TodoRepository _repository;

  Future<List<TodoItem>> call() async {
    try {
      final todoItemList = await _repository.fetchDeletedTodos();

      return todoItemList;
    } catch (e, st) {
      Logger().e('FetchDeletedTodosUsecaseでのエラー', e, st);
      throw Exception('ゴミ箱に存在するメモを取得できませんでした。');
    }
  }
}
