import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/features/todo/presentation/todo_list_notifier.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/create'),
        child: const Icon(Icons.edit),
      ),
      body: ref.watch(todoListAsyncNotifierProvider).when(
            data: data,
            error: error,
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
    );
  }
}
