// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoList {
  /// メモのリスト
  List<TodoItem> get items => throw _privateConstructorUsedError;

  /// ページングできるかどうかを示すフラグ
  ///
  /// これ以上ページングできない場合はtrueとなります。
  bool get hasReachedMax => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoListCopyWith<TodoList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListCopyWith<$Res> {
  factory $TodoListCopyWith(TodoList value, $Res Function(TodoList) then) =
      _$TodoListCopyWithImpl<$Res, TodoList>;
  @useResult
  $Res call({List<TodoItem> items, bool hasReachedMax});
}

/// @nodoc
class _$TodoListCopyWithImpl<$Res, $Val extends TodoList>
    implements $TodoListCopyWith<$Res> {
  _$TodoListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? hasReachedMax = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TodoItem>,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoListCopyWith<$Res> implements $TodoListCopyWith<$Res> {
  factory _$$_TodoListCopyWith(
          _$_TodoList value, $Res Function(_$_TodoList) then) =
      __$$_TodoListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TodoItem> items, bool hasReachedMax});
}

/// @nodoc
class __$$_TodoListCopyWithImpl<$Res>
    extends _$TodoListCopyWithImpl<$Res, _$_TodoList>
    implements _$$_TodoListCopyWith<$Res> {
  __$$_TodoListCopyWithImpl(
      _$_TodoList _value, $Res Function(_$_TodoList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? hasReachedMax = null,
  }) {
    return _then(_$_TodoList(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TodoItem>,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TodoList extends _TodoList with DiagnosticableTreeMixin {
  const _$_TodoList(
      {required final List<TodoItem> items, this.hasReachedMax = false})
      : _items = items,
        super._();

  /// メモのリスト
  final List<TodoItem> _items;

  /// メモのリスト
  @override
  List<TodoItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// ページングできるかどうかを示すフラグ
  ///
  /// これ以上ページングできない場合はtrueとなります。
  @override
  @JsonKey()
  final bool hasReachedMax;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodoList(items: $items, hasReachedMax: $hasReachedMax)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TodoList'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('hasReachedMax', hasReachedMax));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoList &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), hasReachedMax);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoListCopyWith<_$_TodoList> get copyWith =>
      __$$_TodoListCopyWithImpl<_$_TodoList>(this, _$identity);
}

abstract class _TodoList extends TodoList {
  const factory _TodoList(
      {required final List<TodoItem> items,
      final bool hasReachedMax}) = _$_TodoList;
  const _TodoList._() : super._();

  @override

  /// メモのリスト
  List<TodoItem> get items;
  @override

  /// ページングできるかどうかを示すフラグ
  ///
  /// これ以上ページングできない場合はtrueとなります。
  bool get hasReachedMax;
  @override
  @JsonKey(ignore: true)
  _$$_TodoListCopyWith<_$_TodoList> get copyWith =>
      throw _privateConstructorUsedError;
}
