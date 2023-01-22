import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'todo_item.freezed.dart';

/// メモのドメイン
///
/// ドメインに関するロジックはできる限り、ドメインクラスに記載すること。
@freezed
class TodoItem with _$TodoItem {
  // メソッドを追加する場合はプライベートコンストラクターを定義します。
  const TodoItem._();

  const factory TodoItem({
    /// メモを識別するユニークなid
    ///
    /// isarのidの型がintのため、ドメインのidもintとしています。
    required int id,

    /// メモのタイトル
    required String title,

    /// メモの内容
    required String discription,

    /// メモの作成日
    ///
    /// 現状、使用している箇所は特にありません。
    required DateTime createAt,

    /// ゴミ箱に入っているか否か
    ///
    /// このアプリではメモを一旦ゴミ箱に格納し、
    /// 90日経過するとゴミ箱からメモが完全に削除される設定としています。
    required bool isGarbage,

    /// メモの更新日
    ///
    /// メモの更新日はisarデータベースにてソート対象となります。
    /// 日付が近い日から順番にメモを表示させます。
    required DateTime updatedAt,
  }) = _TodoItem;

  TodoItem toGarbage({required bool toGabage}) => copyWith(isGarbage: toGabage);

  TodoItem updateDateTime() => copyWith(updatedAt: DateTime.now());

  TodoItem update({required String title, required String discription}) =>
      copyWith(
        title: title,
        discription: discription,
        updatedAt: DateTime.now(),
      );

  String get updatedAtText {
    final formatter = DateFormat('yyyy年MM月dd日(E)HH:mm', 'ja');

    return formatter.format(updatedAt);
  }

  bool get isEmptyTitle => title.isEmpty;

  bool get isEmptyDiscription => discription.isEmpty;
}
