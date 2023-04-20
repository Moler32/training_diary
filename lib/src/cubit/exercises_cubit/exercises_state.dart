part of 'exercises_cubit.dart';

@freezed
class ExercisesState with _$ExercisesState {
  const factory ExercisesState.loading() = Loading;
  const factory ExercisesState.loadingStartStopTraining() =
      LoadingStartStopTraining;

  const factory ExercisesState.reorderable(List<Exercise> exercises) =
      Reorderable;
  const factory ExercisesState.startWorkout() = StartWorkout;
  const factory ExercisesState.stopWorkout() = StopWorkout;
  const factory ExercisesState.error(String message) = Error;
  const factory ExercisesState.emtyList() = EmptyList;
  const factory ExercisesState.loadedList(List<Exercise> exercises) =
      LoadedList;
}
