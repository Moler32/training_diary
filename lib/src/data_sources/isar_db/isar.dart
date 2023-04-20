import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:training_diary/core/constants/images.dart';
import 'package:training_diary/src/models/locale/locale_model.dart';

import '../../models/trainings/training_model.dart';

@LazySingleton()
class IsarDB {
  List<Training> _trainings = [];
  List<Training> get trainings => _trainings;

  List<Exercise> _exercises = [];
  // List<Exercise> get exercises => _exercises;

  Isar? isar;
  List<LocaleModel> _localeModel = [];
  List<LocaleModel> get localeModel => _localeModel;

  Future<List<Exercise>> fetchExercises(int trainingIndex) async {
    _exercises = trainings[trainingIndex].exercises;
    return _exercises;
  }

  Future<LocaleModel?> fetchLanguage() async {
    _localeModel = await isar!.localeModels.where().findAll();
    if (_localeModel.isEmpty) {
      _localeModel = [LocaleModel('en', usaFlag, 'USA')];
    }
    return localeModel.first;
  }

  Future<void> addlanguage(LocaleModel localeModel) async {
    await isar!.writeTxn(() async {
      await isar!.localeModels.clear();
      isar!.localeModels.put(localeModel);
    });
  }

  Future<List<Training>> fetchTrainings() async {
    isar ??= await Isar.open(
      [TrainingSchema, LocaleModelSchema],
    );
    // await isar!.clear();
    _trainings = await isar!.trainings.where().findAll();
    return _trainings;
  }

  Future<void> addTraining(Training training) async {
    await isar!.writeTxn(() async {
      isar!.trainings.put(training);
    });
    _trainings.add(training);
  }

  Future<void> saveTrainingRuningStatus(Training training) async {
    await isar!.writeTxn(() async {
      isar!.trainings.put(training);
    });
    _trainings.add(training);
  }

  Future<void> editTraining(Training training) async {
    await isar!.writeTxn(() async {
      isar!.trainings.put(training);
    });
  }

  Future<void> editExercise(Training training) async {
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

  Future<void> onReorderableExercise(Training training) async {
    await isar!.writeTxn(() async {
      isar!.trainings.put(training);
    });
  }
}
