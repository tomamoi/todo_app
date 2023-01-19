import 'package:isar/isar.dart';
import 'package:todo/features/todo/domain/todo_domain_importer.dart';

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
    required this.isDeleted,
    required this.updatedAt,
  });

  Id? id;

  final String title;

  final String discription;

  @Index()
  final DateTime createAt;

  @Index()
  final bool isDeleted;

  final DateTime updatedAt;

  factory TodoDto.fromDomain(TodoItem item) => TodoDto(
        id: item.id,
        title: item.title,
        discription: item.discription,
        createAt: item.createAt,
        isDeleted: item.isDeleted,
        updatedAt: item.updatedAt,
      );

  TodoItem toDomain() => TodoItem(
        id: id!,
        title: title,
        discription: discription,
        createAt: createAt,
        isDeleted: isDeleted,
        updatedAt: updatedAt,
      );
}
