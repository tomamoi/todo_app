import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:todo/constants.dart';
import 'package:todo/features/todo/domain/todo_domain_importer.dart';
import 'package:todo/features/todo/infrastructure/todo_infrastructure_importer.dart';
import 'package:todo/features/todo/usecase/custom_exception.dart';

/// UsecaseはPresentation層のみで使用すること
final fetchTodosUsecaseProvider =
    Provider.autoDispose<FetchTodosUsecase>((ref) {
  return FetchTodosUsecase(ref.watch(todoRepositoryProvider));
});

/// メモの取得を行うロジック並びにエラー処理を行います。
///
/// あくまでアプリケーション特有の処理を行うところであり、
/// ドメイン由来のロジックはドメインクラスに記載することが重要です。
class FetchTodosUsecase {
  FetchTodosUsecase(this._repository);
  final TodoRepository _repository;

  Future<List<TodoItem>> call({required int offset}) async {
    try {
      final todoItemList = await _repository.fetchTodos(page, offset);

      return todoItemList;
    } catch (e, st) {
      Logger().e('FetchTodosUsecaseでのエラー', e, st);
      throw CustomException('メモを取得できませんでした。');
    }
  }
}
