import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/presentation/create_or_edit_todo/create_or_edit_todo_page.dart';
import 'package:todo/presentation/todo/todo_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return _router;
});

final _router = GoRouter(
  routes: [
    // 最初に表示されるページ
    GoRoute(
      path: '/',
      builder: (context, state) => const TodoPage(),
    ),
    GoRoute(
      path: '/create',
      builder: (context, state) => const CreateOrEditTodoPage(),
    ),
  ],
);
