part of 'exercises_cubit.dart';

@freezed
class ExercisesState with _$ExercisesState {
  const factory ExercisesState.loading() = Loading;
  const factory ExercisesState.startWorkout() = StartWorkout;
  const factory ExercisesState.stopWorkout() = StopWorkout;
  const factory ExercisesState.error(String message) = Error;
  const factory ExercisesState.emtyList() = EmptyList;
  const factory ExercisesState.loadedList(List<Exercise> exersises) =
      LoadedList;
  const factory ExercisesState.addExercise() = AddExercise;
  const factory ExercisesState.editExercise() = EditExercise;
}
