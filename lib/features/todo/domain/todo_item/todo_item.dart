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

    /// 完全に削除されておらず、ゴミ箱に入っている場合はtrue。
    ///
    /// 90日経過すると完全に削除される設定となっています。
    required bool isGarbage,
    required DateTime updatedAt,
  }) = _TodoItem;

  TodoItem toGarbage({required bool toGabage}) => copyWith(isGarbage: toGabage);

  TodoItem updateDateTime() => copyWith(updatedAt: DateTime.now());

  String get updatedAtText {
    final formatter = DateFormat('yyyy年MM月dd日(E)HH:mm');

    return formatter.format(updatedAt);
  }

  bool get isEmptyTitle => title.isEmpty;

  bool get isEmptyDiscription => discription.isEmpty;
}
