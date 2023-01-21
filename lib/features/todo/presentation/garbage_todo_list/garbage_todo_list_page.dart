import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:todo/features/todo/domain/todo_domain_importer.dart';
import 'package:todo/features/todo/usecase/todo_usecase_importer.dart';
import 'package:todo/theme.dart';

import '../todo_list/widgets/todo_card.dart';

final _garbageTodoListProvider = FutureProvider.autoDispose<List<TodoItem>>(
  (ref) async {
    final garbageTodoList = await ref.read(fetchGarbageTodosUsecaseProvider)();

    return garbageTodoList;
  },
);

class GarbageTodoListPage extends ConsumerWidget {
  const GarbageTodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.greyColor,
        title: const Text(
          'ゴミ箱',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 25),
                Text(
                  '90日経過すると完全に削除されます。',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.paleTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  '⇦左にスワイプすると完全に削除されます。\n復元したい時は、⇨右にスワイプして下さい。',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.paleTextColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ref.watch(_garbageTodoListProvider).when(
                  error: (e, st) {
                    Logger().e('_garbageTodoListProviderにエラー発生', e, st);

                    return const Center(child: Text('データベースエラー'));
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  data: (garbageTodoList) {
                    return RefreshIndicator(
                      onRefresh: () async =>
                          ref.invalidate(_garbageTodoListProvider),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ListView.builder(
                          itemCount: garbageTodoList.length,
                          itemBuilder: (context, index) {
                            final item = garbageTodoList[index];

                            return TodoCard(todoItem: item);
                          },
                        ),
                      ),
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}
