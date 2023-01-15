import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:todo/constants.dart';
import 'package:todo/domain/todo/todo_item/todo_item.dart';
import 'package:todo/infrastructure/todo_repository.dart';

final fetchTodosUsecaseProvider =
    Provider.autoDispose<FetchTodosUsecase>((ref) {
  return FetchTodosUsecase(ref.watch(todoRepositoryProvider));
});

class FetchTodosUsecase {
  FetchTodosUsecase(this._repository);
  final TodoRepository _repository;

  Future<List<TodoItem>> call() async {
    try {
      final todoItemList = await _repository.fetchTodos(page);

      return todoItemList;
    } catch (e, st) {
      Logger().e('FetchTodosUsecaseでのエラー', e, st);
      throw Exception('メモを取得できませんでした。');
    }
  }
}
