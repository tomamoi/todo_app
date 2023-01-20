// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoItem {
  /// メモを識別するユニークなid
  ///
  /// isarのidの型がintのため、ドメインのidもintとしています。
  int get id => throw _privateConstructorUsedError;

  /// メモのタイトル
  String get title => throw _privateConstructorUsedError;

  /// メモの内容
  String get discription => throw _privateConstructorUsedError;

  /// メモの作成日
  ///
  /// 現状、使用している箇所は特にありません。
  DateTime get createAt => throw _privateConstructorUsedError;

  /// ゴミ箱に入っているか否か
  ///
  /// このアプリではメモを一旦ゴミ箱に格納し、
  /// 90日経過するとゴミ箱からメモが完全に削除される設定としています。
  bool get isGarbage => throw _privateConstructorUsedError;

  /// メモの更新日
  ///
  /// メモの更新日はisarデータベースにてソート対象となります。
  /// 日付が近い日から順番にメモを表示させます。
  DateTime get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoItemCopyWith<TodoItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoItemCopyWith<$Res> {
  factory $TodoItemCopyWith(TodoItem value, $Res Function(TodoItem) then) =
      _$TodoItemCopyWithImpl<$Res, TodoItem>;
  @useResult
  $Res call(
      {int id,
      String title,
      String discription,
      DateTime createAt,
      bool isGarbage,
      DateTime updatedAt});
}

/// @nodoc
class _$TodoItemCopyWithImpl<$Res, $Val extends TodoItem>
    implements $TodoItemCopyWith<$Res> {
  _$TodoItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? discription = null,
    Object? createAt = null,
    Object? isGarbage = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      discription: null == discription
          ? _value.discription
          : discription // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isGarbage: null == isGarbage
          ? _value.isGarbage
          : isGarbage // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoItemCopyWith<$Res> implements $TodoItemCopyWith<$Res> {
  factory _$$_TodoItemCopyWith(
          _$_TodoItem value, $Res Function(_$_TodoItem) then) =
      __$$_TodoItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String discription,
      DateTime createAt,
      bool isGarbage,
      DateTime updatedAt});
}

/// @nodoc
class __$$_TodoItemCopyWithImpl<$Res>
    extends _$TodoItemCopyWithImpl<$Res, _$_TodoItem>
    implements _$$_TodoItemCopyWith<$Res> {
  __$$_TodoItemCopyWithImpl(
      _$_TodoItem _value, $Res Function(_$_TodoItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? discription = null,
    Object? createAt = null,
    Object? isGarbage = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_TodoItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      discription: null == discription
          ? _value.discription
          : discription // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isGarbage: null == isGarbage
          ? _value.isGarbage
          : isGarbage // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_TodoItem extends _TodoItem with DiagnosticableTreeMixin {
  const _$_TodoItem(
      {required this.id,
      required this.title,
      required this.discription,
      required this.createAt,
      required this.isGarbage,
      required this.updatedAt})
      : super._();

  /// メモを識別するユニークなid
  ///
  /// isarのidの型がintのため、ドメインのidもintとしています。
  @override
  final int id;

  /// メモのタイトル
  @override
  final String title;

  /// メモの内容
  @override
  final String discription;

  /// メモの作成日
  ///
  /// 現状、使用している箇所は特にありません。
  @override
  final DateTime createAt;

  /// ゴミ箱に入っているか否か
  ///
  /// このアプリではメモを一旦ゴミ箱に格納し、
  /// 90日経過するとゴミ箱からメモが完全に削除される設定としています。
  @override
  final bool isGarbage;

  /// メモの更新日
  ///
  /// メモの更新日はisarデータベースにてソート対象となります。
  /// 日付が近い日から順番にメモを表示させます。
  @override
  final DateTime updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodoItem(id: $id, title: $title, discription: $discription, createAt: $createAt, isGarbage: $isGarbage, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TodoItem'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('discription', discription))
      ..add(DiagnosticsProperty('createAt', createAt))
      ..add(DiagnosticsProperty('isGarbage', isGarbage))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.discription, discription) ||
                other.discription == discription) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.isGarbage, isGarbage) ||
                other.isGarbage == isGarbage) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, discription, createAt, isGarbage, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoItemCopyWith<_$_TodoItem> get copyWith =>
      __$$_TodoItemCopyWithImpl<_$_TodoItem>(this, _$identity);
}

abstract class _TodoItem extends TodoItem {
  const factory _TodoItem(
      {required final int id,
      required final String title,
      required final String discription,
      required final DateTime createAt,
      required final bool isGarbage,
      required final DateTime updatedAt}) = _$_TodoItem;
  const _TodoItem._() : super._();

  @override

  /// メモを識別するユニークなid
  ///
  /// isarのidの型がintのため、ドメインのidもintとしています。
  int get id;
  @override

  /// メモのタイトル
  String get title;
  @override

  /// メモの内容
  String get discription;
  @override

  /// メモの作成日
  ///
  /// 現状、使用している箇所は特にありません。
  DateTime get createAt;
  @override

  /// ゴミ箱に入っているか否か
  ///
  /// このアプリではメモを一旦ゴミ箱に格納し、
  /// 90日経過するとゴミ箱からメモが完全に削除される設定としています。
  bool get isGarbage;
  @override

  /// メモの更新日
  ///
  /// メモの更新日はisarデータベースにてソート対象となります。
  /// 日付が近い日から順番にメモを表示させます。
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_TodoItemCopyWith<_$_TodoItem> get copyWith =>
      throw _privateConstructorUsedError;
}
