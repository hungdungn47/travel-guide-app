// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HotelState {
  bool get loading => throw _privateConstructorUsedError;
  bool get isRecommending => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  List<Hotel> get hotels => throw _privateConstructorUsedError;
  String get currentSearchPrompt => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;

  /// Create a copy of HotelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HotelStateCopyWith<HotelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelStateCopyWith<$Res> {
  factory $HotelStateCopyWith(
          HotelState value, $Res Function(HotelState) then) =
      _$HotelStateCopyWithImpl<$Res, HotelState>;
  @useResult
  $Res call(
      {bool loading,
      bool isRecommending,
      bool isDone,
      List<Hotel> hotels,
      String currentSearchPrompt,
      int currentIndex});
}

/// @nodoc
class _$HotelStateCopyWithImpl<$Res, $Val extends HotelState>
    implements $HotelStateCopyWith<$Res> {
  _$HotelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HotelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isRecommending = null,
    Object? isDone = null,
    Object? hotels = null,
    Object? currentSearchPrompt = null,
    Object? currentIndex = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecommending: null == isRecommending
          ? _value.isRecommending
          : isRecommending // ignore: cast_nullable_to_non_nullable
              as bool,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      hotels: null == hotels
          ? _value.hotels
          : hotels // ignore: cast_nullable_to_non_nullable
              as List<Hotel>,
      currentSearchPrompt: null == currentSearchPrompt
          ? _value.currentSearchPrompt
          : currentSearchPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HotelStateImplCopyWith<$Res>
    implements $HotelStateCopyWith<$Res> {
  factory _$$HotelStateImplCopyWith(
          _$HotelStateImpl value, $Res Function(_$HotelStateImpl) then) =
      __$$HotelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool isRecommending,
      bool isDone,
      List<Hotel> hotels,
      String currentSearchPrompt,
      int currentIndex});
}

/// @nodoc
class __$$HotelStateImplCopyWithImpl<$Res>
    extends _$HotelStateCopyWithImpl<$Res, _$HotelStateImpl>
    implements _$$HotelStateImplCopyWith<$Res> {
  __$$HotelStateImplCopyWithImpl(
      _$HotelStateImpl _value, $Res Function(_$HotelStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HotelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isRecommending = null,
    Object? isDone = null,
    Object? hotels = null,
    Object? currentSearchPrompt = null,
    Object? currentIndex = null,
  }) {
    return _then(_$HotelStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecommending: null == isRecommending
          ? _value.isRecommending
          : isRecommending // ignore: cast_nullable_to_non_nullable
              as bool,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      hotels: null == hotels
          ? _value._hotels
          : hotels // ignore: cast_nullable_to_non_nullable
              as List<Hotel>,
      currentSearchPrompt: null == currentSearchPrompt
          ? _value.currentSearchPrompt
          : currentSearchPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HotelStateImpl implements _HotelState {
  const _$HotelStateImpl(
      {this.loading = false,
      this.isRecommending = true,
      this.isDone = false,
      final List<Hotel> hotels = const [],
      this.currentSearchPrompt = '',
      this.currentIndex = 0})
      : _hotels = hotels;

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool isRecommending;
  @override
  @JsonKey()
  final bool isDone;
  final List<Hotel> _hotels;
  @override
  @JsonKey()
  List<Hotel> get hotels {
    if (_hotels is EqualUnmodifiableListView) return _hotels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hotels);
  }

  @override
  @JsonKey()
  final String currentSearchPrompt;
  @override
  @JsonKey()
  final int currentIndex;

  @override
  String toString() {
    return 'HotelState(loading: $loading, isRecommending: $isRecommending, isDone: $isDone, hotels: $hotels, currentSearchPrompt: $currentSearchPrompt, currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotelStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isRecommending, isRecommending) ||
                other.isRecommending == isRecommending) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            const DeepCollectionEquality().equals(other._hotels, _hotels) &&
            (identical(other.currentSearchPrompt, currentSearchPrompt) ||
                other.currentSearchPrompt == currentSearchPrompt) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      isRecommending,
      isDone,
      const DeepCollectionEquality().hash(_hotels),
      currentSearchPrompt,
      currentIndex);

  /// Create a copy of HotelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HotelStateImplCopyWith<_$HotelStateImpl> get copyWith =>
      __$$HotelStateImplCopyWithImpl<_$HotelStateImpl>(this, _$identity);
}

abstract class _HotelState implements HotelState {
  const factory _HotelState(
      {final bool loading,
      final bool isRecommending,
      final bool isDone,
      final List<Hotel> hotels,
      final String currentSearchPrompt,
      final int currentIndex}) = _$HotelStateImpl;

  @override
  bool get loading;
  @override
  bool get isRecommending;
  @override
  bool get isDone;
  @override
  List<Hotel> get hotels;
  @override
  String get currentSearchPrompt;
  @override
  int get currentIndex;

  /// Create a copy of HotelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HotelStateImplCopyWith<_$HotelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
