import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/features/todo/domain/todo_domain_importer.dart';
import 'package:todo/features/todo/presentation/todo_list_notifier.dart';
import 'package:todo/features/todo/usecase/change_to_garbage_status_usecase.dart';
import 'package:todo/features/todo/usecase/todo_usecase_importer.dart';

/// GarbageTodoListPageでのみ使用するProvider
final garbageTodoListAsyncNotifierProvider =
    AsyncNotifierProvider.autoDispose<GarbageTodoListNotifier, TodoList>(
  GarbageTodoListNotifier.new,
);

class GarbageTodoListNotifier extends AutoDisposeAsyncNotifier<TodoList> {
  @override
  FutureOr<TodoList> build() async {
    const todoList = TodoList(items: []);
    await ref.read(deleteTodosUsecaseProvider)();
    final todoItemList = await ref.read(fetchGarbageTodosUsecaseProvider)();

    return todoList.fetch(todoItemList);
  }

  Future<void> returnFromTrash(TodoItem item) async {
    state = await AsyncValue.guard(() async {
      final todoItem = await ref.read(changeToGarbageStatusUsecaseProvider)(
        item: item,
        toGabage: false,
        isUndoing: false,
      );

      return state.value!.remove(todoItem);
    });

    // 変更の結果をTodoListPageに反映しておく必要があるので、providerをリフレッシュします。
    ref.invalidate(todoListAsyncNotifierProvider);
  }

  Future<void> undoToReturnFromTrash(TodoItem item, int index) async {
    state = await AsyncValue.guard(() async {
      final todoItem = await ref.read(changeToGarbageStatusUsecaseProvider)(
        item: item,
        toGabage: true,
        isUndoing: true,
      );

      return state.value!.insert(todoItem, index);
    });

    // 変更の結果をTodoListPageに反映しておく必要があるので、providerをリフレッシュします。
    ref.invalidate(todoListAsyncNotifierProvider);
  }
}
