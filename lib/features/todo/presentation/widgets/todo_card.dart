import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/features/todo/domain/todo_domain_importer.dart';
import 'package:todo/theme.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.todoItem,
  });

  final TodoItem todoItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/todo/${todoItem.id}', extra: todoItem),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding:
            const EdgeInsets.only(top: 16, bottom: 18, left: 15, right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todoItem.isEmptyTitle ? 'タイトル未記入' : todoItem.title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: todoItem.isEmptyTitle ? AppColor.paleTextColor : null,
              ),
              overflow: TextOverflow.clip,
            ),
            const SizedBox(height: 3),
            Text(
              todoItem.discription,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
              overflow: TextOverflow.clip,
            ),
            const SizedBox(height: 17),
            Text(
              todoItem.updatedAtText,
              style: const TextStyle(
                fontSize: 12,
                color: AppColor.paleTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
