import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:todo/features/todo/domain/todo_domain_importer.dart';
import 'package:todo/features/todo/infrastructure/todo_infrastructure_importer.dart';

/// UsecaseはPresentation層のみで使用すること
final fetchGarbageTodosUsecaseProvider =
    Provider.autoDispose<FetchGarbageTodosUsecase>((ref) {
  return FetchGarbageTodosUsecase(ref.watch(todoRepositoryProvider));
});

/// ゴミ箱に入っているメモの取得を行うロジック並びにエラー処理を行います。
///
/// あくまでアプリケーション特有の処理を行うところであり、
/// ドメイン由来のロジックはドメインクラスに記載することが重要です。
class FetchGarbageTodosUsecase {
  FetchGarbageTodosUsecase(this._repository);
  final TodoRepository _repository;

  Future<List<TodoItem>> call() async {
    try {
      final todoItemList = await _repository.fetchGarbageTodos();

      return todoItemList;
    } catch (e, st) {
      Logger().e('FetchDeletedTodosUsecaseでのエラー', e, st);
      throw Exception('ゴミ箱に存在するメモを取得できませんでした。');
    }
  }
}
