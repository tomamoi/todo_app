import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/domain/todo/todo_item/todo_item.dart';

part 'todo_list.freezed.dart';

@freezed
class TodoList with _$TodoList {
  // メソッドを追加する場合はプライベートコンストラクターを定義
  const TodoList._();

  const factory TodoList({
    required List<TodoItem> items,
    required bool hasReachedMax,
  }) = _TodoList;
}
