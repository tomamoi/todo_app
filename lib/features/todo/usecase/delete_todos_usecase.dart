import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:todo/features/todo/infrastructure/todo_infrastructure_importer.dart';

/// UsecaseはPresentation層のみで使用すること
final deleteTodosUsecaseProvider =
    Provider.autoDispose<DeleteTodosUsecase>((ref) {
  return DeleteTodosUsecase(ref.watch(todoRepositoryProvider));
});

/// ゴミ箱に入っているメモを削除するロジック並びにエラー処理を行います。
///
/// あくまでアプリケーション特有の処理を行うところであり、
/// ドメイン由来のロジックはドメインクラスに記載することが重要です。
class DeleteTodosUsecase {
  DeleteTodosUsecase(this._repository);
  final TodoRepository _repository;

  Future<void> call() async {
    try {
      final deletedTodoItemList =
          await _repository.fetchTodoListScheduledToDelete();
      await _repository.deleteAll(deletedTodoItemList);

      return;
    } catch (e, st) {
      Logger().e('DeleteTodosUsecaseでのエラー', e, st);
      throw Exception('メモをローカルから削除できませんでした。');
    }
  }
}
