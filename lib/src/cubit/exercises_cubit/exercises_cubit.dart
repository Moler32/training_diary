import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:training_diary/src/data_sources/provider/isar_provider.dart';
import 'package:training_diary/src/models/trainings/training_model.dart';
part 'exercises_state.dart';
part 'exercises_cubit.freezed.dart';

@injectable
class ExercisesCubit extends Cubit<ExercisesState> {
  ExercisesCubit(this.isarProvider) : super(const ExercisesState.loading());
  final IsarProvider isarProvider;

  List<Exercise> _exercises = [];

  Future<void> fetchExercises(int trainingIndex) async {
    try {
      emit(const ExercisesState.loading());
      await Future.delayed(const Duration(milliseconds: 400));
      await _getExercises(trainingIndex);
      if (_exercises.isEmpty) {
        emit(const ExercisesState.emtyList());
      } else {
        emit(ExercisesState.loadedList(_exercises));
        emit(const ExercisesState.stopWorkout());
      }
    } catch (e) {
      emit(ExercisesState.error(e.toString()));
    }
  }

  Future<List<Exercise>> _getExercises(int trainingIndex) async {
    _exercises = await isarProvider.fetchExercises(trainingIndex);
    return _exercises;
  }

  Future<void> addExercise(
      Exercise exercise, Training training, int trainingIndex) async {
    try {
      await isarProvider.addExercise(exercise, training);
      await _getExercises(trainingIndex);
      emit(ExercisesState.loadedList(_exercises));
    } catch (e) {
      emit(ExercisesState.error(e.toString()));
    }
  }

  Future<void> startWorkout(bool isPlaying) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));
      emit(const ExercisesState.startWorkout());
    } catch (e) {
      emit(ExercisesState.error(e.toString()));
    }
  }

  Future<void> stopWorkout(bool isPlaying) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));
      emit(const ExercisesState.stopWorkout());
    } catch (e) {
      emit(ExercisesState.error(e.toString()));
    }
  }

  Future<void> changeCopleteStatus(
    Exercise exercise,
    int trainingIndex,
    Training training,
  ) async {
    try {
      exercise.isComlete = !exercise.isComlete;
      await isarProvider.changeCompleteStatus(training);
      await _getExercises(trainingIndex);
      emit(const ExercisesState.loading());
      emit(ExercisesState.loadedList(_exercises));
    } catch (e) {
      emit(ExercisesState.error(e.toString()));
    }
  }

  Future<void> deleteExercise(
    Training training,
    Exercise exercise,
    int trainingIndex,
  ) async {
    try {
      final list = training.exercises.toList();
      list.remove(exercise);
      training.exercises = list;
      await isarProvider.deleteExercise(training);
      await _getExercises(trainingIndex);
      emit(ExercisesState.loadedList(_exercises));
    } catch (e) {
      emit(ExercisesState.error(e.toString()));
    }
  }

  Future<void> editExersice(Training training, int trainingIndex) async {
    try {
      await isarProvider.editExercise(training);
      await _getExercises(trainingIndex);
      emit(const ExercisesState.loading());
      emit(ExercisesState.loadedList(_exercises));
    } catch (e) {
      emit(ExercisesState.error(e.toString()));
    }
  }

  // _listenExercisesChanges() {
  //   isarProvider.addListener(this);
  // }
}
