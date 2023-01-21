import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/theme.dart';

class TodoDrawer extends StatelessWidget {
  const TodoDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 80, left: 15, right: 15),
        child: ListView(
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.cancel,
                    color: AppColor.greyColor,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _DrawerListTile(
              iconData: Icons.delete,
              title: 'ゴミ箱',
              onPressed: () {
                Navigator.of(context).pop();
                context.push('/garbage');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerListTile extends StatelessWidget {
  const _DrawerListTile({
    required this.iconData,
    required this.title,
    required this.onPressed,
  });

  final IconData iconData;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(left: 13, right: 25),
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(iconData),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Icon(Icons.navigate_next),
          ],
        ),
      ),
    );
  }
}
