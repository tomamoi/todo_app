import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/features/todo/domain/todo_domain_importer.dart';
import 'package:todo/features/todo/usecase/todo_usecase_importer.dart';

/// グローバルで使用するプロバイダー
/// 今回はtodoListとなります。

final todoListAsyncNotifierProvider =
    AsyncNotifierProvider.autoDispose<TodoListNotifier, TodoList>(
  TodoListNotifier.new,
);

class TodoListNotifier extends AutoDisposeAsyncNotifier<TodoList> {
  @override
  FutureOr<TodoList> build() async {
    const todoList = TodoList(items: []);
    final todoItemList = await ref.read(fetchTodosUsecaseProvider)();

    return todoList.fetch(todoItemList);
  }

  Future<void> addTodoItem({
    required String title,
    required String discription,
  }) async {
    // 取得済みのデータを保持しながら状態をローディング中にします。
    state = const AsyncValue<TodoList>.loading().copyWithPrevious(state);
    state = await AsyncValue.guard(() async {
      final todoItem = await ref.read(addTodoUsecaseProvider)(
        title: title,
        discription: discription,
      );

      return state.value!.add(todoItem);
    });
  }

  Future<void> editTodoItem({
    required String title,
    required String discription,
    required TodoItem item,
  }) async {
    // 取得済みのデータを保持しながら状態をローディング中にします。
    state = const AsyncValue<TodoList>.loading().copyWithPrevious(state);
    state = await AsyncValue.guard(() async {
      final todoItem = await ref.read(editTodoUsecaseProvider)(
        title: title,
        discription: discription,
        item: item,
      );

      return state.value!.edit(todoItem);
    });
  }
}
