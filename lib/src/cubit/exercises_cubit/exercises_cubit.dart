import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:training_diary/src/models/trainings/training_model.dart';
import 'package:training_diary/src/repositories/exercises/exercises_repository.dart';
part 'exercises_state.dart';
part 'exercises_cubit.freezed.dart';

@injectable
class ExercisesCubit extends Cubit<ExercisesState> {
  ExercisesCubit(this._exercisesRepository)
      : super(const ExercisesState.loading());
  // final IsarDB isarDB;

  final ExercisesRepository _exercisesRepository;

  List<Exercise> _exercises = [];

  Future<void> fetchExercises(int trainingIndex) async {
    try {
      emit(const ExercisesState.loading());
      await Future.delayed(const Duration(milliseconds: 400));
      await _getExercises(trainingIndex);
      if (_exercises.isEmpty) {
        emit(const ExercisesState.emtyList());
        emit(const ExercisesState.stopWorkout());
      } else {
        emit(ExercisesState.loadedList(_exercises));
        emit(const ExercisesState.stopWorkout());
      }
    } catch (e, st) {
      emit(ExercisesState.error(e.toString()));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  Future<List<Exercise>> _getExercises(int trainingIndex) async {
    _exercises = await _exercisesRepository.fetchExercises(trainingIndex);
    return _exercises;
  }

  Future<void> addExercise(
      Exercise exercise, Training training, int trainingIndex) async {
    try {
      await _exercisesRepository.addExercise(exercise, training);
      await _getExercises(trainingIndex);
      emit(ExercisesState.loadedList(_exercises));
    } catch (e, st) {
      emit(ExercisesState.error(e.toString()));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  // Future<void> startTraining(Training training) async {
  //   try {
  //     int time = DateTime.now().millisecondsSinceEpoch;
  //     final timeNow = DateTime.fromMillisecondsSinceEpoch(time);
  //     training.savedDataTime = timeNow;
  //     bool? status = training.isTrainingStarted;
  //     if (status == false || status == null) {
  //       training.isTrainingStarted = true;
  //     } else {
  //       training.isTrainingStarted = false;
  //     }

  //     await isarProvider.saveTrainingRuningStatus(training);
  //     emit(ExercisesState.loadingStartStopTraining());
  //     await Future.delayed(const Duration(milliseconds: 200));
  //     emit(const ExercisesState.startWorkout());
  //   } catch (e) {
  //     emit(ExercisesState.error(e.toString()));
  //   }
  // }

  // Future<void> stopTraining(Training training) async {
  //   try {
  //     training.savedDataTime = DateTime.tryParse('0');
  //     bool? status = training.isTrainingStarted;
  //     if (status == true || status == null) {
  //       training.isTrainingStarted = false;
  //     } else {
  //       training.isTrainingStarted = true;
  //     }
  //     await isarProvider.saveTrainingRuningStatus(training);
  //     emit(ExercisesState.loadingStartStopTraining());
  //     await Future.delayed(const Duration(milliseconds: 200));
  //     emit(const ExercisesState.stopWorkout());
  //   } catch (e) {
  //     emit(ExercisesState.error(e.toString()));
  //   }
  // }

  Future<void> changeCopleteStatus(
    Exercise exercise,
    int trainingIndex,
    Training training,
  ) async {
    try {
      exercise.isComlete = !exercise.isComlete;
      await _exercisesRepository.changeCompleteStatus(training);
      await _getExercises(trainingIndex);
      emit(const ExercisesState.loading());
      emit(ExercisesState.loadedList(_exercises));
    } catch (e, st) {
      emit(ExercisesState.error(e.toString()));
      GetIt.I<Talker>().handle(e, st);
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
      await _exercisesRepository.deleteExercise(training);
      await _getExercises(trainingIndex);
      if (_exercises.isEmpty) {
        emit(ExercisesState.emtyList());
      } else {
        emit(ExercisesState.loadedList(_exercises));
      }
    } catch (e, st) {
      emit(ExercisesState.error(e.toString()));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  Future<void> editExersice(Training training, int trainingIndex) async {
    try {
      await _exercisesRepository.editExercise(training);
      await _getExercises(trainingIndex);
      emit(const ExercisesState.loading());
      emit(ExercisesState.loadedList(_exercises));
    } catch (e, st) {
      emit(ExercisesState.error(e.toString()));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  Future<void> reorderableExercise(
      Training training, int trainingIndex, int oldIndex, int newIndex) async {
    try {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final Exercise item = training.exercises.elementAt(oldIndex);
      final list = training.exercises.toList();
      list.removeAt(oldIndex);
      list.insert(newIndex, item);
      training.exercises = list;
      _exercisesRepository.onReorderableExercise(training);
      await _getExercises(trainingIndex);

      // emit(const ExercisesState.loading());
      // await Future.delayed(Duration(seconds: 1));
      emit(ExercisesState.loadedList(_exercises));
    } catch (e, st) {
      emit(ExercisesState.error(e.toString()));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }

  // Future<void> saveDateTime(Training training, Exercise exercise) async {
  //   try {
  //     int date = DateTime.now().millisecondsSinceEpoch;
  //     final dateNow = DateTime.fromMillisecondsSinceEpoch(date);
  //     exercise.savedDataTime = dateNow;
  //     await isarProvider.addDateTime(training, exercise);
  //     // await _getExercises(trainingIndex);
  //     // emit(ExercisesState.loadedList(_exercises));
  //   } catch (e) {
  //     emit(ExercisesState.error(e.toString()));
  //   }
  // }

  // _listenExercisesChanges() {
  //   isarProvider.addListener(this);
  // }
}
