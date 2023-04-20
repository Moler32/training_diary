part of 'stopwatch_cubit.dart';

@freezed
class StopwatchState with _$StopwatchState {
  const factory StopwatchState.loadingStopwatch() = LoadingStopwatch;
  const factory StopwatchState.stop(Duration timeDifference) = Stop;
  const factory StopwatchState.start(Duration timeDifference) = Start;
  const factory StopwatchState.pause(Duration timeDifference) = Pause;
  const factory StopwatchState.errorStopwatch(String message) = ErrorStopwatch;
}
