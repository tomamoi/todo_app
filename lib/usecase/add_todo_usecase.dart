import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:todo/domain/todo/todo_item/todo_item.dart';
import 'package:todo/infrastructure/dto/todo_dto.dart';
import 'package:todo/infrastructure/todo_repository.dart';

final addTodoUsecaseProvider = Provider.autoDispose<AddTodoUsecase>((ref) {
  return AddTodoUsecase(ref.watch(todoRepositoryProvider));
});

class AddTodoUsecase {
  AddTodoUsecase(this._repository);
  final TodoRepository _repository;

  Future<TodoItem> call({
    required String title,
    required String discription,
  }) async {
    try {
      final now = DateTime.now();
      final todoDto = TodoDto(
        title: title,
        discription: discription,
        createAt: now,
        isDeleted: false,
        updatedAt: now,
      );
      final todoItem = await _repository.add(todoDto);

      return todoItem;
    } catch (e, st) {
      Logger().e('AddTodoUsecaseでのエラー', e, st);
      throw Exception('メモを保存できませんでした。');
    }
  }
}
