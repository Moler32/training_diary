// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locale_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocaleState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(LocaleModel localeModel) changedLocale,
    required TResult Function(String message) errorLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(LocaleModel localeModel)? changedLocale,
    TResult? Function(String message)? errorLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(LocaleModel localeModel)? changedLocale,
    TResult Function(String message)? errorLocale,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingLocale value) loading,
    required TResult Function(ChangedLocale value) changedLocale,
    required TResult Function(ErrorLocale value) errorLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingLocale value)? loading,
    TResult? Function(ChangedLocale value)? changedLocale,
    TResult? Function(ErrorLocale value)? errorLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingLocale value)? loading,
    TResult Function(ChangedLocale value)? changedLocale,
    TResult Function(ErrorLocale value)? errorLocale,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocaleStateCopyWith<$Res> {
  factory $LocaleStateCopyWith(
          LocaleState value, $Res Function(LocaleState) then) =
      _$LocaleStateCopyWithImpl<$Res, LocaleState>;
}

/// @nodoc
class _$LocaleStateCopyWithImpl<$Res, $Val extends LocaleState>
    implements $LocaleStateCopyWith<$Res> {
  _$LocaleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingLocaleCopyWith<$Res> {
  factory _$$LoadingLocaleCopyWith(
          _$LoadingLocale value, $Res Function(_$LoadingLocale) then) =
      __$$LoadingLocaleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingLocaleCopyWithImpl<$Res>
    extends _$LocaleStateCopyWithImpl<$Res, _$LoadingLocale>
    implements _$$LoadingLocaleCopyWith<$Res> {
  __$$LoadingLocaleCopyWithImpl(
      _$LoadingLocale _value, $Res Function(_$LoadingLocale) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingLocale implements LoadingLocale {
  const _$LoadingLocale();

  @override
  String toString() {
    return 'LocaleState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingLocale);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(LocaleModel localeModel) changedLocale,
    required TResult Function(String message) errorLocale,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(LocaleModel localeModel)? changedLocale,
    TResult? Function(String message)? errorLocale,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(LocaleModel localeModel)? changedLocale,
    TResult Function(String message)? errorLocale,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingLocale value) loading,
    required TResult Function(ChangedLocale value) changedLocale,
    required TResult Function(ErrorLocale value) errorLocale,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingLocale value)? loading,
    TResult? Function(ChangedLocale value)? changedLocale,
    TResult? Function(ErrorLocale value)? errorLocale,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingLocale value)? loading,
    TResult Function(ChangedLocale value)? changedLocale,
    TResult Function(ErrorLocale value)? errorLocale,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingLocale implements LocaleState {
  const factory LoadingLocale() = _$LoadingLocale;
}

/// @nodoc
abstract class _$$ChangedLocaleCopyWith<$Res> {
  factory _$$ChangedLocaleCopyWith(
          _$ChangedLocale value, $Res Function(_$ChangedLocale) then) =
      __$$ChangedLocaleCopyWithImpl<$Res>;
  @useResult
  $Res call({LocaleModel localeModel});
}

/// @nodoc
class __$$ChangedLocaleCopyWithImpl<$Res>
    extends _$LocaleStateCopyWithImpl<$Res, _$ChangedLocale>
    implements _$$ChangedLocaleCopyWith<$Res> {
  __$$ChangedLocaleCopyWithImpl(
      _$ChangedLocale _value, $Res Function(_$ChangedLocale) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localeModel = null,
  }) {
    return _then(_$ChangedLocale(
      null == localeModel
          ? _value.localeModel
          : localeModel // ignore: cast_nullable_to_non_nullable
              as LocaleModel,
    ));
  }
}

/// @nodoc

class _$ChangedLocale implements ChangedLocale {
  const _$ChangedLocale(this.localeModel);

  @override
  final LocaleModel localeModel;

  @override
  String toString() {
    return 'LocaleState.changedLocale(localeModel: $localeModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangedLocale &&
            (identical(other.localeModel, localeModel) ||
                other.localeModel == localeModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localeModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangedLocaleCopyWith<_$ChangedLocale> get copyWith =>
      __$$ChangedLocaleCopyWithImpl<_$ChangedLocale>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(LocaleModel localeModel) changedLocale,
    required TResult Function(String message) errorLocale,
  }) {
    return changedLocale(localeModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(LocaleModel localeModel)? changedLocale,
    TResult? Function(String message)? errorLocale,
  }) {
    return changedLocale?.call(localeModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(LocaleModel localeModel)? changedLocale,
    TResult Function(String message)? errorLocale,
    required TResult orElse(),
  }) {
    if (changedLocale != null) {
      return changedLocale(localeModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingLocale value) loading,
    required TResult Function(ChangedLocale value) changedLocale,
    required TResult Function(ErrorLocale value) errorLocale,
  }) {
    return changedLocale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingLocale value)? loading,
    TResult? Function(ChangedLocale value)? changedLocale,
    TResult? Function(ErrorLocale value)? errorLocale,
  }) {
    return changedLocale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingLocale value)? loading,
    TResult Function(ChangedLocale value)? changedLocale,
    TResult Function(ErrorLocale value)? errorLocale,
    required TResult orElse(),
  }) {
    if (changedLocale != null) {
      return changedLocale(this);
    }
    return orElse();
  }
}

abstract class ChangedLocale implements LocaleState {
  const factory ChangedLocale(final LocaleModel localeModel) = _$ChangedLocale;

  LocaleModel get localeModel;
  @JsonKey(ignore: true)
  _$$ChangedLocaleCopyWith<_$ChangedLocale> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorLocaleCopyWith<$Res> {
  factory _$$ErrorLocaleCopyWith(
          _$ErrorLocale value, $Res Function(_$ErrorLocale) then) =
      __$$ErrorLocaleCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorLocaleCopyWithImpl<$Res>
    extends _$LocaleStateCopyWithImpl<$Res, _$ErrorLocale>
    implements _$$ErrorLocaleCopyWith<$Res> {
  __$$ErrorLocaleCopyWithImpl(
      _$ErrorLocale _value, $Res Function(_$ErrorLocale) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorLocale(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorLocale implements ErrorLocale {
  const _$ErrorLocale(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LocaleState.errorLocale(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorLocale &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorLocaleCopyWith<_$ErrorLocale> get copyWith =>
      __$$ErrorLocaleCopyWithImpl<_$ErrorLocale>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(LocaleModel localeModel) changedLocale,
    required TResult Function(String message) errorLocale,
  }) {
    return errorLocale(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(LocaleModel localeModel)? changedLocale,
    TResult? Function(String message)? errorLocale,
  }) {
    return errorLocale?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(LocaleModel localeModel)? changedLocale,
    TResult Function(String message)? errorLocale,
    required TResult orElse(),
  }) {
    if (errorLocale != null) {
      return errorLocale(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingLocale value) loading,
    required TResult Function(ChangedLocale value) changedLocale,
    required TResult Function(ErrorLocale value) errorLocale,
  }) {
    return errorLocale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingLocale value)? loading,
    TResult? Function(ChangedLocale value)? changedLocale,
    TResult? Function(ErrorLocale value)? errorLocale,
  }) {
    return errorLocale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingLocale value)? loading,
    TResult Function(ChangedLocale value)? changedLocale,
    TResult Function(ErrorLocale value)? errorLocale,
    required TResult orElse(),
  }) {
    if (errorLocale != null) {
      return errorLocale(this);
    }
    return orElse();
  }
}

abstract class ErrorLocale implements LocaleState {
  const factory ErrorLocale(final String message) = _$ErrorLocale;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorLocaleCopyWith<_$ErrorLocale> get copyWith =>
      throw _privateConstructorUsedError;
}
