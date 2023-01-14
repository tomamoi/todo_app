// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoItem _$$_TodoItemFromJson(Map<String, dynamic> json) => _$_TodoItem(
      id: json['id'] as String,
      title: json['title'] as String,
      discription: json['discription'] as String,
      createAt: DateTime.parse(json['createAt'] as String),
    );

Map<String, dynamic> _$$_TodoItemToJson(_$_TodoItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'discription': instance.discription,
      'createAt': instance.createAt.toIso8601String(),
    };
