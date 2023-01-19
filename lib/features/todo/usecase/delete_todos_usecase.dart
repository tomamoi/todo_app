import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:todo/features/todo/domain/todo_domain_importer.dart';
import 'package:todo/features/todo/infrastructure/todo_infrastructure_importer.dart';

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
