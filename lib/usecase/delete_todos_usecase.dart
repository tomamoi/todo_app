import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:todo/domain/todo/todo_item/todo_item.dart';
import 'package:todo/infrastructure/todo_repository.dart';

final deleteTodosUsecaseProvider =
    Provider.autoDispose<DeleteTodosUsecase>((ref) {
  return DeleteTodosUsecase(ref.watch(todoRepositoryProvider));
});

class DeleteTodosUsecase {
  DeleteTodosUsecase(this._repository);
  final TodoRepository _repository;

  Future<void> call({required List<TodoItem> deletedTodoItemList}) async {
    try {
      await _repository.deleteAll(deletedTodoItemList);

      return;
    } catch (e, st) {
      Logger().e('DeleteTodosUsecaseでのエラー', e, st);
      throw Exception('メモをローカルから削除できませんでした。');
    }
  }
}
