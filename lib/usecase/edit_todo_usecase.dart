import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:todo/domain/todo/todo_item/todo_item.dart';
import 'package:todo/infrastructure/todo_repository.dart';

final editTodoUsecaseProvider = Provider.autoDispose<EditTodoUsecase>((ref) {
  return EditTodoUsecase(ref.watch(todoRepositoryProvider));
});

class EditTodoUsecase {
  EditTodoUsecase(this._repository);
  final TodoRepository _repository;

  Future<TodoItem> call({
    required String title,
    required String discription,
    required TodoItem item,
  }) async {
    try {
      final now = DateTime.now();

      final updatedTodoItem = item.copyWith(
        title: title,
        discription: discription,
        updatedAt: now,
      );
      await _repository.edit(updatedTodoItem);

      return updatedTodoItem;
    } catch (e, st) {
      Logger().e('EditTodoUsecaseでのエラー', e, st);
      throw Exception('メモを編集できませんでした。');
    }
  }
}
