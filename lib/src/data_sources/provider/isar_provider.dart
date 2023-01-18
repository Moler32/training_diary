import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:training_diary/src/cubit/trainings_cubit/trainings_cubit.dart';

import '../../models/trainings/training_model.dart';
import 'isar_provider_listener.dart';

@LazySingleton()
class IsarProvider {
  // IsarProvider() {
  //   init();
  // }

  List<Training> _trainings = [];
  List<Training> get trainings => _trainings;

  List<Exercise> _exercises = [];

  Isar? isar;
  // final List<IsarReposytoryListener> _listeners = [];

  // void init() async {
  //   isar = await Isar.open(
  //     [TrainingSchema],
  //   );

  // final trainingsCollection = isar!.trainings;
  // _trainings = await trainingsCollection.where().findAll();
  // }

  Future<List<Exercise>> fetchExercises(int trainingIndex) async {
    _exercises = trainings[trainingIndex].exercises;
    return _exercises;
  }

  Future<List<Training>> fetchTrainings() async {
    isar ??= await Isar.open(
      [TrainingSchema],
    );
    _trainings = await isar!.trainings.where().findAll();
    return _trainings;
  }

  Future<void> addTraining(Training training) async {
    await isar!.writeTxn(() async {
      isar!.trainings.put(training);
    });
    _trainings.add(training);
  }

  Future<void> renameTraining(Training training) async {
    await isar!.writeTxn(() async {
      isar!.trainings.put(training);
    });
  }

  Future<void> deleteTraining(Training training) async {
    await isar!.writeTxn(() async {
      isar!.trainings.delete(training.id);
    });
    _trainings.remove(training);
  }

  Future<void> addExercise(Exercise exercise, Training training) async {
    await isar!.writeTxn(() async {
      final list = training.exercises.toList();
      list.add(exercise);
      training.exercises = list;
      isar!.trainings.put(training);
    });
  }

  Future<void> changeCompleteStatus(Training training) async {
    await isar!.writeTxn(() async {
      isar!.trainings.put(training);
    });
  }

  Future<void> deleteExercise(Training training) async {
    await isar!.writeTxn(() async {
      isar!.trainings.put(training);
    });
  }

  // void addListener(IsarReposytoryListener listener) {
  //   if (!_listeners.contains(listener)) {
  //     _listeners.add(listener);
  //   }
  // }

  // void removeListener(IsarReposytoryListener listener) {
  //   if (!_listeners.contains(listener)) {
  //     _listeners.remove(listener);
  //   }
  // }

  // Future<void> onUpdateAllTrainings() async {
  //   print('6');
  //   final trainings = await fetchTrainings();
  //   for (final listener in _listeners) {
  //     listener.onUpdateTrainings(trainings);
  //     print('0');
  //   }
  // }
}
