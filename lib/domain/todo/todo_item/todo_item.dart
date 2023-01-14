import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'todo_item.freezed.dart';
part 'todo_item.g.dart';

@freezed
class TodoItem with _$TodoItem {
  // メソッドを追加する場合はプライベートコンストラクターを定義
  const TodoItem._();

  const factory TodoItem({
    required String id,
    required String title,
    required String discription,
    required DateTime createAt,
  }) = _TodoItem;

  factory TodoItem.fromJson(Map<String, dynamic> json) =>
      _$TodoItemFromJson(json);

  String get createAtText {
    final formatter = DateFormat('yyyy年MM月dd日(E)HH:mm');

    return formatter.format(createAt);
  }
}
