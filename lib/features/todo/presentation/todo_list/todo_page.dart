import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:todo/features/todo/presentation/todo_list/widgets/todo_card.dart';
import 'package:todo/features/todo/presentation/todo_list_notifier.dart';

final _scrollControllerProvider = Provider.autoDispose<ScrollController>(
  (ref) {
    final controller = ScrollController();
    ref.onDispose(() {
      controller.dispose();
    });

    controller.addListener(() {
      final todoList = ref.read(todoListAsyncNotifierProvider).value;
      if (todoList?.hasReachedMax != false) return;

      const threshold = 0.8;
      // 現在のスクロールしている割合（0：上端、1：末端）
      final scrollRatio =
          controller.offset / controller.position.maxScrollExtent;
      if (scrollRatio < threshold) return;
      ref.read(todoListAsyncNotifierProvider.notifier).fetchMore();
    });

    return controller;
  },
);

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(todoListAsyncNotifierProvider);
    final notifier = ref.watch(todoListAsyncNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/create'),
        child: const Icon(Icons.edit),
      ),
      body: asyncValue.when(
        error: (e, st) {
          Logger().e('todoListAsyncNotifierにエラー発生', e, st);

          return const Center(child: Text('データベースエラー'));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (todoList) {
          return Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async =>
                      ref.invalidate(todoListAsyncNotifierProvider),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListView.builder(
                      controller: ref.watch(_scrollControllerProvider),
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                        final item = todoList.items[index];

                        return Dismissible(
                          key: Key(item.id.toString()),
                          direction: DismissDirection.startToEnd,
                          onDismissed: (direction) async {
                            await notifier.putInTrash(item);
                            final snackBar = SnackBar(
                              content: const Text('メモをゴミ箱に入れました'),
                              action: SnackBarAction(
                                label: '取消',
                                onPressed: () =>
                                    notifier.undoToPutInTrash(item, index),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: TodoCard(todoItem: item),
                        );
                      },
                    ),
                  ),
                ),
              ),
              if (asyncValue.isLoading)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(child: CircularProgressIndicator()),
                ),
            ],
          );
        },
      ),
    );
  }
}
