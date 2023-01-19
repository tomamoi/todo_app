import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/features/todo/domain/todo_domain_importer.dart';
import 'package:todo/features/todo/presentation/todo_list_notifier.dart';
import 'package:todo/theme.dart';

final _textEditingControllerProvider =
    Provider.autoDispose.family<TextEditingController, String>((ref, text) {
  final controller = TextEditingController(text: text);
  ref.onDispose(() {
    controller.dispose();
  });

  return controller;
});

final _discriptionEditingControllerProvider =
    Provider.autoDispose.family<TextEditingController, String>((ref, text) {
  final controller = TextEditingController(text: text);
  ref.onDispose(() {
    controller.dispose();
  });

  return controller;
});

class CreateOrEditTodoPage extends ConsumerWidget {
  const CreateOrEditTodoPage({
    super.key,
    this.item,
  });

  /// 新しくtodoを作成する場合はnullを渡します。
  ///
  /// 編集の場合は、編集したい[TodoItem]を渡します。
  final TodoItem? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleEditingController =
        ref.watch(_textEditingControllerProvider(item?.title ?? ''));

    final discriptionEditingController = ref
        .watch(_discriptionEditingControllerProvider(item?.discription ?? ''));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // 戻るボタン押下で保存されるようにします。
          onPressed: () async {
            final title = titleEditingController.text;
            final discription = discriptionEditingController.text;
            if (title.isEmpty && discription.isEmpty) return;
            final asyncNotifier =
                ref.read(todoListAsyncNotifierProvider.notifier);
            if (item == null) {
              await asyncNotifier.addTodoItem(
                title: title,
                discription: discription,
              );
            } else {
              await asyncNotifier.editTodoItem(
                title: title,
                discription: discription,
                item: item!,
              );
            }
            if (ref.read(todoListAsyncNotifierProvider) is AsyncError) return;
            context.go('/');
          },
          icon: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            children: [
              TextFormField(
                controller: titleEditingController,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'タイトル',
                  hintStyle: TextStyle(
                    color: AppColor.greyTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: discriptionEditingController,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '本文を記入してください',
                  hintStyle: TextStyle(
                    color: AppColor.greyTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
