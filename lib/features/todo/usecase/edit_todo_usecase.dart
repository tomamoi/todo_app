import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:todo/features/todo/domain/todo_domain_importer.dart';
import 'package:todo/features/todo/infrastructure/todo_infrastructure_importer.dart';

/// UsecaseはPresentation層のみで使用すること
final editTodoUsecaseProvider = Provider.autoDispose<EditTodoUsecase>((ref) {
  return EditTodoUsecase(ref.watch(todoRepositoryProvider));
});

/// メモを編集するロジック並びにエラー処理を行います。
///
/// あくまでアプリケーション特有の処理を行うところであり、
/// ドメイン由来のロジックはドメインクラスに記載することが重要です。
class EditTodoUsecase {
  EditTodoUsecase(this._repository);
  final TodoRepository _repository;

  Future<TodoItem> call({
    required String title,
    required String discription,
    required TodoItem item,
  }) async {
    try {
      final updatedTodoItem = item.update(
        title: title,
        discription: discription,
      );
      await _repository.edit(updatedTodoItem);

      return updatedTodoItem;
    } catch (e, st) {
      Logger().e('EditTodoUsecaseでのエラー', e, st);
      throw Exception('メモを編集できませんでした。');
    }
  }
}
