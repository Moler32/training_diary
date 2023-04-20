import 'package:injectable/injectable.dart';
import 'package:training_diary/src/data_sources/isar_db/exercise_isar.dart';

import '../../models/trainings/training_model.dart';

abstract class ExercisesRepository {
  Future<List<Exercise>> fetchExercises(int trainingIndex);
  Future<void> editExercise(Training training);
  Future<void> addExercise(Exercise exercise, Training training);
  Future<void> deleteExercise(Training training);
  Future<void> onReorderableExercise(Training training);
  Future<void> changeCompleteStatus(Training training);
}

@LazySingleton(as: ExercisesRepository)
class ExercisesRepositoryImpl extends ExercisesRepository {
  ExercisesRepositoryImpl(this.exercisesIsarDB);

  final ExercisesIsarDB exercisesIsarDB;

  List<Exercise> _exercises = [];

  @override
  Future<List<Exercise>> fetchExercises(int trainingIndex) async {
    _exercises = await exercisesIsarDB.fetchExercises(trainingIndex);
    return _exercises;
  }

  @override
  Future<void> deleteExercise(Training training) async {
    await exercisesIsarDB.deleteExercise(training);
  }

  @override
  Future<void> editExercise(Training training) async {
    await exercisesIsarDB.editExercise(training);
  }

  @override
  Future<void> addExercise(Exercise exercise, Training training) async {
    await exercisesIsarDB.addExercise(exercise, training);
  }

  @override
  Future<void> onReorderableExercise(Training training) async {
    await exercisesIsarDB.onReorderableExercise(training);
  }

  @override
  Future<void> changeCompleteStatus(Training training) async {
    await exercisesIsarDB.changeCompleteStatus(training);
  }
}
