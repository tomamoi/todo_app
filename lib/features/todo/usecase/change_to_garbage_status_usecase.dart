import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:todo/features/todo/domain/todo_domain_importer.dart';
import 'package:todo/features/todo/infrastructure/todo_infrastructure_importer.dart';

/// UsecaseはPresentation層のみで使用すること
final changeToGarbageStatusUsecaseProvider =
    Provider.autoDispose<ChangeToGarbageStatusUsecase>((ref) {
  return ChangeToGarbageStatusUsecase(ref.watch(todoRepositoryProvider));
});

/// ゴミ箱に入れるか元に戻すかのロジック並びにエラー処理を行います。
///
/// あくまでアプリケーション特有の処理を行うところであり、
/// ドメイン由来のロジックはドメインクラスに記載することが重要です。
class ChangeToGarbageStatusUsecase {
  ChangeToGarbageStatusUsecase(this._repository);
  final TodoRepository _repository;

  Future<TodoItem> call({
    required TodoItem item,
    required bool toGabage,
    required bool isUndoing,
  }) async {
    try {
      // 取消処理の場合は更新日を元の更新日にしておく必要があるため、updateDateTime関数を適用せず、
      // 取消以外の場合は更新日を最新にします。
      final garbageTodoItem = isUndoing
          ? item.toGarbage(toGabage: toGabage)
          : item.toGarbage(toGabage: toGabage).updateDateTime();

      await _repository.edit(garbageTodoItem);

      return garbageTodoItem;
    } catch (e, st) {
      Logger().e('ChangeToGarbageStatusUsecaseでのエラー', e, st);
      throw Exception('メモのゴミ状態を変更できませんでした。');
    }
  }
}
