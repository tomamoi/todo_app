import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

/// main.dartでoverrideを行います。
///
/// Isar.open関数はFutureのため、main.dartにて初期化しています。
final todoIsarProvider = Provider<Isar>((ref) => throw UnimplementedError());

final todoRepositoryProvider =
    Provider((ref) => TodoRepository(ref.watch(todoIsarProvider)));

class TodoRepository {
  TodoRepository(this.isar);
  final Isar isar;
}
