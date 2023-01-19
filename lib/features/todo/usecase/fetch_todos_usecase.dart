import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:todo/constants.dart';
import 'package:todo/features/todo/domain/todo_domain_importer.dart';
import 'package:todo/features/todo/infrastructure/todo_infrastructure_importer.dart';

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
