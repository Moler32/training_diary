// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stopwatch_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StopwatchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingStopwatch,
    required TResult Function(Duration timeDifference) stop,
    required TResult Function(Duration timeDifference) start,
    required TResult Function(Duration timeDifference) pause,
    required TResult Function(String message) errorStopwatch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadingStopwatch,
    TResult? Function(Duration timeDifference)? stop,
    TResult? Function(Duration timeDifference)? start,
    TResult? Function(Duration timeDifference)? pause,
    TResult? Function(String message)? errorStopwatch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingStopwatch,
    TResult Function(Duration timeDifference)? stop,
    TResult Function(Duration timeDifference)? start,
    TResult Function(Duration timeDifference)? pause,
    TResult Function(String message)? errorStopwatch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingStopwatch value) loadingStopwatch,
    required TResult Function(Stop value) stop,
    required TResult Function(Start value) start,
    required TResult Function(Pause value) pause,
    required TResult Function(ErrorStopwatch value) errorStopwatch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingStopwatch value)? loadingStopwatch,
    TResult? Function(Stop value)? stop,
    TResult? Function(Start value)? start,
    TResult? Function(Pause value)? pause,
    TResult? Function(ErrorStopwatch value)? errorStopwatch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingStopwatch value)? loadingStopwatch,
    TResult Function(Stop value)? stop,
    TResult Function(Start value)? start,
    TResult Function(Pause value)? pause,
    TResult Function(ErrorStopwatch value)? errorStopwatch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StopwatchStateCopyWith<$Res> {
  factory $StopwatchStateCopyWith(
          StopwatchState value, $Res Function(StopwatchState) then) =
      _$StopwatchStateCopyWithImpl<$Res, StopwatchState>;
}

/// @nodoc
class _$StopwatchStateCopyWithImpl<$Res, $Val extends StopwatchState>
    implements $StopwatchStateCopyWith<$Res> {
  _$StopwatchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingStopwatchCopyWith<$Res> {
  factory _$$LoadingStopwatchCopyWith(
          _$LoadingStopwatch value, $Res Function(_$LoadingStopwatch) then) =
      __$$LoadingStopwatchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStopwatchCopyWithImpl<$Res>
    extends _$StopwatchStateCopyWithImpl<$Res, _$LoadingStopwatch>
    implements _$$LoadingStopwatchCopyWith<$Res> {
  __$$LoadingStopwatchCopyWithImpl(
      _$LoadingStopwatch _value, $Res Function(_$LoadingStopwatch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingStopwatch implements LoadingStopwatch {
  const _$LoadingStopwatch();

  @override
  String toString() {
    return 'StopwatchState.loadingStopwatch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStopwatch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingStopwatch,
    required TResult Function(Duration timeDifference) stop,
    required TResult Function(Duration timeDifference) start,
    required TResult Function(Duration timeDifference) pause,
    required TResult Function(String message) errorStopwatch,
  }) {
    return loadingStopwatch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadingStopwatch,
    TResult? Function(Duration timeDifference)? stop,
    TResult? Function(Duration timeDifference)? start,
    TResult? Function(Duration timeDifference)? pause,
    TResult? Function(String message)? errorStopwatch,
  }) {
    return loadingStopwatch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingStopwatch,
    TResult Function(Duration timeDifference)? stop,
    TResult Function(Duration timeDifference)? start,
    TResult Function(Duration timeDifference)? pause,
    TResult Function(String message)? errorStopwatch,
    required TResult orElse(),
  }) {
    if (loadingStopwatch != null) {
      return loadingStopwatch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingStopwatch value) loadingStopwatch,
    required TResult Function(Stop value) stop,
    required TResult Function(Start value) start,
    required TResult Function(Pause value) pause,
    required TResult Function(ErrorStopwatch value) errorStopwatch,
  }) {
    return loadingStopwatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingStopwatch value)? loadingStopwatch,
    TResult? Function(Stop value)? stop,
    TResult? Function(Start value)? start,
    TResult? Function(Pause value)? pause,
    TResult? Function(ErrorStopwatch value)? errorStopwatch,
  }) {
    return loadingStopwatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingStopwatch value)? loadingStopwatch,
    TResult Function(Stop value)? stop,
    TResult Function(Start value)? start,
    TResult Function(Pause value)? pause,
    TResult Function(ErrorStopwatch value)? errorStopwatch,
    required TResult orElse(),
  }) {
    if (loadingStopwatch != null) {
      return loadingStopwatch(this);
    }
    return orElse();
  }
}

abstract class LoadingStopwatch implements StopwatchState {
  const factory LoadingStopwatch() = _$LoadingStopwatch;
}

/// @nodoc
abstract class _$$StopCopyWith<$Res> {
  factory _$$StopCopyWith(_$Stop value, $Res Function(_$Stop) then) =
      __$$StopCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration timeDifference});
}

/// @nodoc
class __$$StopCopyWithImpl<$Res>
    extends _$StopwatchStateCopyWithImpl<$Res, _$Stop>
    implements _$$StopCopyWith<$Res> {
  __$$StopCopyWithImpl(_$Stop _value, $Res Function(_$Stop) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeDifference = null,
  }) {
    return _then(_$Stop(
      null == timeDifference
          ? _value.timeDifference
          : timeDifference // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$Stop implements Stop {
  const _$Stop(this.timeDifference);

  @override
  final Duration timeDifference;

  @override
  String toString() {
    return 'StopwatchState.stop(timeDifference: $timeDifference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Stop &&
            (identical(other.timeDifference, timeDifference) ||
                other.timeDifference == timeDifference));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timeDifference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StopCopyWith<_$Stop> get copyWith =>
      __$$StopCopyWithImpl<_$Stop>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingStopwatch,
    required TResult Function(Duration timeDifference) stop,
    required TResult Function(Duration timeDifference) start,
    required TResult Function(Duration timeDifference) pause,
    required TResult Function(String message) errorStopwatch,
  }) {
    return stop(timeDifference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadingStopwatch,
    TResult? Function(Duration timeDifference)? stop,
    TResult? Function(Duration timeDifference)? start,
    TResult? Function(Duration timeDifference)? pause,
    TResult? Function(String message)? errorStopwatch,
  }) {
    return stop?.call(timeDifference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingStopwatch,
    TResult Function(Duration timeDifference)? stop,
    TResult Function(Duration timeDifference)? start,
    TResult Function(Duration timeDifference)? pause,
    TResult Function(String message)? errorStopwatch,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(timeDifference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingStopwatch value) loadingStopwatch,
    required TResult Function(Stop value) stop,
    required TResult Function(Start value) start,
    required TResult Function(Pause value) pause,
    required TResult Function(ErrorStopwatch value) errorStopwatch,
  }) {
    return stop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingStopwatch value)? loadingStopwatch,
    TResult? Function(Stop value)? stop,
    TResult? Function(Start value)? start,
    TResult? Function(Pause value)? pause,
    TResult? Function(ErrorStopwatch value)? errorStopwatch,
  }) {
    return stop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingStopwatch value)? loadingStopwatch,
    TResult Function(Stop value)? stop,
    TResult Function(Start value)? start,
    TResult Function(Pause value)? pause,
    TResult Function(ErrorStopwatch value)? errorStopwatch,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(this);
    }
    return orElse();
  }
}

abstract class Stop implements StopwatchState {
  const factory Stop(final Duration timeDifference) = _$Stop;

  Duration get timeDifference;
  @JsonKey(ignore: true)
  _$$StopCopyWith<_$Stop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartCopyWith<$Res> {
  factory _$$StartCopyWith(_$Start value, $Res Function(_$Start) then) =
      __$$StartCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration timeDifference});
}

/// @nodoc
class __$$StartCopyWithImpl<$Res>
    extends _$StopwatchStateCopyWithImpl<$Res, _$Start>
    implements _$$StartCopyWith<$Res> {
  __$$StartCopyWithImpl(_$Start _value, $Res Function(_$Start) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeDifference = null,
  }) {
    return _then(_$Start(
      null == timeDifference
          ? _value.timeDifference
          : timeDifference // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$Start implements Start {
  const _$Start(this.timeDifference);

  @override
  final Duration timeDifference;

  @override
  String toString() {
    return 'StopwatchState.start(timeDifference: $timeDifference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Start &&
            (identical(other.timeDifference, timeDifference) ||
                other.timeDifference == timeDifference));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timeDifference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartCopyWith<_$Start> get copyWith =>
      __$$StartCopyWithImpl<_$Start>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingStopwatch,
    required TResult Function(Duration timeDifference) stop,
    required TResult Function(Duration timeDifference) start,
    required TResult Function(Duration timeDifference) pause,
    required TResult Function(String message) errorStopwatch,
  }) {
    return start(timeDifference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadingStopwatch,
    TResult? Function(Duration timeDifference)? stop,
    TResult? Function(Duration timeDifference)? start,
    TResult? Function(Duration timeDifference)? pause,
    TResult? Function(String message)? errorStopwatch,
  }) {
    return start?.call(timeDifference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingStopwatch,
    TResult Function(Duration timeDifference)? stop,
    TResult Function(Duration timeDifference)? start,
    TResult Function(Duration timeDifference)? pause,
    TResult Function(String message)? errorStopwatch,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(timeDifference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingStopwatch value) loadingStopwatch,
    required TResult Function(Stop value) stop,
    required TResult Function(Start value) start,
    required TResult Function(Pause value) pause,
    required TResult Function(ErrorStopwatch value) errorStopwatch,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingStopwatch value)? loadingStopwatch,
    TResult? Function(Stop value)? stop,
    TResult? Function(Start value)? start,
    TResult? Function(Pause value)? pause,
    TResult? Function(ErrorStopwatch value)? errorStopwatch,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingStopwatch value)? loadingStopwatch,
    TResult Function(Stop value)? stop,
    TResult Function(Start value)? start,
    TResult Function(Pause value)? pause,
    TResult Function(ErrorStopwatch value)? errorStopwatch,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class Start implements StopwatchState {
  const factory Start(final Duration timeDifference) = _$Start;

  Duration get timeDifference;
  @JsonKey(ignore: true)
  _$$StartCopyWith<_$Start> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PauseCopyWith<$Res> {
  factory _$$PauseCopyWith(_$Pause value, $Res Function(_$Pause) then) =
      __$$PauseCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration timeDifference});
}

/// @nodoc
class __$$PauseCopyWithImpl<$Res>
    extends _$StopwatchStateCopyWithImpl<$Res, _$Pause>
    implements _$$PauseCopyWith<$Res> {
  __$$PauseCopyWithImpl(_$Pause _value, $Res Function(_$Pause) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeDifference = null,
  }) {
    return _then(_$Pause(
      null == timeDifference
          ? _value.timeDifference
          : timeDifference // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$Pause implements Pause {
  const _$Pause(this.timeDifference);

  @override
  final Duration timeDifference;

  @override
  String toString() {
    return 'StopwatchState.pause(timeDifference: $timeDifference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Pause &&
            (identical(other.timeDifference, timeDifference) ||
                other.timeDifference == timeDifference));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timeDifference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PauseCopyWith<_$Pause> get copyWith =>
      __$$PauseCopyWithImpl<_$Pause>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingStopwatch,
    required TResult Function(Duration timeDifference) stop,
    required TResult Function(Duration timeDifference) start,
    required TResult Function(Duration timeDifference) pause,
    required TResult Function(String message) errorStopwatch,
  }) {
    return pause(timeDifference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadingStopwatch,
    TResult? Function(Duration timeDifference)? stop,
    TResult? Function(Duration timeDifference)? start,
    TResult? Function(Duration timeDifference)? pause,
    TResult? Function(String message)? errorStopwatch,
  }) {
    return pause?.call(timeDifference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingStopwatch,
    TResult Function(Duration timeDifference)? stop,
    TResult Function(Duration timeDifference)? start,
    TResult Function(Duration timeDifference)? pause,
    TResult Function(String message)? errorStopwatch,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause(timeDifference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingStopwatch value) loadingStopwatch,
    required TResult Function(Stop value) stop,
    required TResult Function(Start value) start,
    required TResult Function(Pause value) pause,
    required TResult Function(ErrorStopwatch value) errorStopwatch,
  }) {
    return pause(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingStopwatch value)? loadingStopwatch,
    TResult? Function(Stop value)? stop,
    TResult? Function(Start value)? start,
    TResult? Function(Pause value)? pause,
    TResult? Function(ErrorStopwatch value)? errorStopwatch,
  }) {
    return pause?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingStopwatch value)? loadingStopwatch,
    TResult Function(Stop value)? stop,
    TResult Function(Start value)? start,
    TResult Function(Pause value)? pause,
    TResult Function(ErrorStopwatch value)? errorStopwatch,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause(this);
    }
    return orElse();
  }
}

abstract class Pause implements StopwatchState {
  const factory Pause(final Duration timeDifference) = _$Pause;

  Duration get timeDifference;
  @JsonKey(ignore: true)
  _$$PauseCopyWith<_$Pause> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorStopwatchCopyWith<$Res> {
  factory _$$ErrorStopwatchCopyWith(
          _$ErrorStopwatch value, $Res Function(_$ErrorStopwatch) then) =
      __$$ErrorStopwatchCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorStopwatchCopyWithImpl<$Res>
    extends _$StopwatchStateCopyWithImpl<$Res, _$ErrorStopwatch>
    implements _$$ErrorStopwatchCopyWith<$Res> {
  __$$ErrorStopwatchCopyWithImpl(
      _$ErrorStopwatch _value, $Res Function(_$ErrorStopwatch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorStopwatch(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorStopwatch implements ErrorStopwatch {
  const _$ErrorStopwatch(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'StopwatchState.errorStopwatch(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStopwatch &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStopwatchCopyWith<_$ErrorStopwatch> get copyWith =>
      __$$ErrorStopwatchCopyWithImpl<_$ErrorStopwatch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadingStopwatch,
    required TResult Function(Duration timeDifference) stop,
    required TResult Function(Duration timeDifference) start,
    required TResult Function(Duration timeDifference) pause,
    required TResult Function(String message) errorStopwatch,
  }) {
    return errorStopwatch(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadingStopwatch,
    TResult? Function(Duration timeDifference)? stop,
    TResult? Function(Duration timeDifference)? start,
    TResult? Function(Duration timeDifference)? pause,
    TResult? Function(String message)? errorStopwatch,
  }) {
    return errorStopwatch?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadingStopwatch,
    TResult Function(Duration timeDifference)? stop,
    TResult Function(Duration timeDifference)? start,
    TResult Function(Duration timeDifference)? pause,
    TResult Function(String message)? errorStopwatch,
    required TResult orElse(),
  }) {
    if (errorStopwatch != null) {
      return errorStopwatch(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingStopwatch value) loadingStopwatch,
    required TResult Function(Stop value) stop,
    required TResult Function(Start value) start,
    required TResult Function(Pause value) pause,
    required TResult Function(ErrorStopwatch value) errorStopwatch,
  }) {
    return errorStopwatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingStopwatch value)? loadingStopwatch,
    TResult? Function(Stop value)? stop,
    TResult? Function(Start value)? start,
    TResult? Function(Pause value)? pause,
    TResult? Function(ErrorStopwatch value)? errorStopwatch,
  }) {
    return errorStopwatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingStopwatch value)? loadingStopwatch,
    TResult Function(Stop value)? stop,
    TResult Function(Start value)? start,
    TResult Function(Pause value)? pause,
    TResult Function(ErrorStopwatch value)? errorStopwatch,
    required TResult orElse(),
  }) {
    if (errorStopwatch != null) {
      return errorStopwatch(this);
    }
    return orElse();
  }
}

abstract class ErrorStopwatch implements StopwatchState {
  const factory ErrorStopwatch(final String message) = _$ErrorStopwatch;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorStopwatchCopyWith<_$ErrorStopwatch> get copyWith =>
      throw _privateConstructorUsedError;
}
