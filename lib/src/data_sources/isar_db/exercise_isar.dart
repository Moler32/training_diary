import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:training_diary/src/data_sources/isar_db/training_isar.dart';

import '../../models/trainings/training_model.dart';

@LazySingleton()
class ExercisesIsarDB {
  List<Exercise> _exercises = [];
  List<Exercise> get exercises => _exercises;

  final Isar isar = GetIt.I<IsarDB>().isar!;

  Future<List<Exercise>> fetchExercises(int trainingIndex) async {
    List<Training> trainings = GetIt.I<IsarDB>().trainings;
    _exercises = trainings[trainingIndex].exercises;
    return _exercises;
  }

  Future<void> editExercise(Training training) async {
    await isar.writeTxn(() async {
      isar.trainings.put(training);
    });
  }

  Future<void> addExercise(Exercise exercise, Training training) async {
    await isar.writeTxn(() async {
      final list = training.exercises.toList();
      list.add(exercise);
      training.exercises = list;
      isar.trainings.put(training);
    });
  }

  Future<void> deleteExercise(Training training) async {
    await isar.writeTxn(() async {
      isar.trainings.put(training);
    });
  }

  Future<void> changeCompleteStatus(Training training) async {
    await isar.writeTxn(() async {
      isar.trainings.put(training);
    });
  }

  Future<void> onReorderableExercise(Training training) async {
    await isar.writeTxn(() async {
      isar.trainings.put(training);
    });
  }
}
