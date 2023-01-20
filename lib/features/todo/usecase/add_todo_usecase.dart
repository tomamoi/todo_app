import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:todo/features/todo/domain/todo_domain_importer.dart';
import 'package:todo/features/todo/infrastructure/todo_infrastructure_importer.dart';

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
        isGarbage: false,
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
