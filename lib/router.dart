import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/features/todo/domain/todo_domain_importer.dart';
import 'package:todo/features/todo/presentation/todo_presentation_importer.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return _router;
});

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const TodoListPage(),
    ),
    GoRoute(
      path: '/create',
      builder: (context, state) => const CreateOrEditTodoPage(),
    ),
    GoRoute(
      path: '/todo/:id',
      builder: (context, state) =>
          CreateOrEditTodoPage(item: state.extra! as TodoItem),
    ),
    GoRoute(
      path: '/garbage',
      builder: (context, state) => const GarbageTodoListPage(),
    ),
  ],
);
