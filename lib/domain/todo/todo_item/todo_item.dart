import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'todo_item.freezed.dart';

@freezed
class TodoItem with _$TodoItem {
  // メソッドを追加する場合はプライベートコンストラクターを定義
  const TodoItem._();

  const factory TodoItem({
    required int id,
    required String title,
    required String discription,
    required DateTime createAt,
    required bool isDeleted,
  }) = _TodoItem;

  String get createAtText {
    final formatter = DateFormat('yyyy年MM月dd日(E)HH:mm');

    return formatter.format(createAt);
  }
}
