import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:todo/features/todo/presentation/garbage_todo_list/garbage_todo_list_notifier.dart';
import 'package:todo/features/todo/presentation/todo_presentation_importer.dart';
import 'package:todo/features/todo/presentation/widgets/snack_bar.dart';
import 'package:todo/features/todo/usecase/custom_exception.dart';
import 'package:todo/theme.dart';

class GarbageTodoListPage extends ConsumerWidget {
  const GarbageTodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(garbageTodoListAsyncNotifierProvider);
    final notifier = ref.watch(garbageTodoListAsyncNotifierProvider.notifier);

    // AsyncErrorの場合はSnackBarを表示させることで、ユーザーにエラー状態を伝えることができます。
    // ユーザーへのメッセージはUsecase層にて定義しています。
    ref.listen(garbageTodoListAsyncNotifierProvider, (previous, next) {
      if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(CustomErrorSnackBar(
          message: (next.error! as CustomException).message,
        ));
      }
    });

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
                  '復元したい時は、⇨右にスワイプして下さい。',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.paleTextColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: asyncValue.when(
              skipError: true,
              error: (e, st) {
                Logger().e('_garbageTodoListProviderにエラー発生', e, st);

                return const Center(child: Text('データベースエラー'));
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (garbageTodoList) {
                return RefreshIndicator(
                  onRefresh: () async =>
                      ref.invalidate(garbageTodoListAsyncNotifierProvider),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListView.builder(
                      itemCount: garbageTodoList.length,
                      itemBuilder: (context, index) {
                        final item = garbageTodoList.items[index];

                        return Dismissible(
                          key: Key(item.id.toString()),
                          direction: DismissDirection.startToEnd,
                          onDismissed: (direction) async {
                            await notifier.returnFromTrash(item);

                            ScaffoldMessenger.of(context)
                                .showSnackBar(CustomSnackBar(
                              message: 'メモをゴミ箱から戻しました',
                              undoLabel: '取消',
                              onUndid: () =>
                                  notifier.undoToReturnFromTrash(item, index),
                            ));
                          },
                          child: TodoCard(
                            todoItem: item,
                          ),
                        );
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
