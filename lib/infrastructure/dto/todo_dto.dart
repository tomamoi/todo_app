import 'package:isar/isar.dart';
import 'package:todo/domain/todo/todo_item/todo_item.dart';

part 'todo_dto.g.dart';

/// Isar専用のDTO(Data Transfer Object)
///
/// Isarはfreezedをサポートしていないため、DTOに変換しています。
///
/// ドメインへ変換も含めたデータ受け渡し専用のクラス

@collection
class TodoDto {
  TodoDto({
    this.id,
    required this.title,
    required this.discription,
    required this.createAt,
  });
  Id? id;
  final String title;
  final String discription;
  final DateTime createAt;

  TodoItem toDomain() => TodoItem(
        id: id!,
        title: title,
        discription: discription,
        createAt: createAt,
      );
}
