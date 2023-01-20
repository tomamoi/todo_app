import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:todo/features/todo/domain/todo_domain_importer.dart';
import 'package:todo/features/todo/infrastructure/todo_infrastructure_importer.dart';

final changeToGarbageStatusUsecaseProvider =
    Provider.autoDispose<ChangeToGarbageStatusUsecase>((ref) {
  return ChangeToGarbageStatusUsecase(ref.watch(todoRepositoryProvider));
});

class ChangeToGarbageStatusUsecase {
  ChangeToGarbageStatusUsecase(this._repository);
  final TodoRepository _repository;

  Future<TodoItem> call({
    required TodoItem item,
    required bool toGabage,
    required bool isUndoing,
  }) async {
    try {
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
