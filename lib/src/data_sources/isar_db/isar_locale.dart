import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:training_diary/src/models/locale/locale_model.dart';

@LazySingleton()
class IsarLocaleDB {
  Isar? isar;
  LocaleModel? localeModel;

  Future<String> fetchLanguage() async {
    isar ??= await Isar.open([LocaleModelSchema]);

    localeModel = await isar!.localeModels.where().findFirst();
    return localeModel?.language ?? 'en';
  }

  Future<void> addlanguage(LocaleModel localeModel) async {
    await isar!.writeTxn(() async {
      isar!.localeModels.put(localeModel);
    });
  }

  // Future<void> saveTrainingRuningStatus(Training training) async {
  //   await isar!.writeTxn(() async {
  //     isar!.trainings.put(training);
  //   });
  //   _trainings.add(training);
  // }

  // Future<void> editTraining(Training training) async {
  //   await isar!.writeTxn(() async {
  //     isar!.trainings.put(training);
  //   });
  // }

  // Future<void> editExercise(Training training) async {
  //   await isar!.writeTxn(() async {
  //     isar!.trainings.put(training);
  //   });
  // }

  // Future<void> deleteTraining(Training training) async {
  //   await isar!.writeTxn(() async {
  //     isar!.trainings.delete(training.id);
  //   });
  //   _trainings.remove(training);
  // }

  // Future<void> addExercise(Exercise exercise, Training training) async {
  //   await isar!.writeTxn(() async {
  //     final list = training.exercises.toList();
  //     list.add(exercise);
  //     training.exercises = list;
  //     isar!.trainings.put(training);
  //   });
  // }

  // Future<void> changeCompleteStatus(Training training) async {
  //   await isar!.writeTxn(() async {
  //     isar!.trainings.put(training);
  //   });
  // }

  // Future<void> deleteExercise(Training training) async {
  //   await isar!.writeTxn(() async {
  //     isar!.trainings.put(training);
  //   });
  // }

  // Future<void> onReorderableExercise(Training training) async {
  //   await isar!.writeTxn(() async {
  //     isar!.trainings.put(training);
  //   });
  // }

  // Future<void> saveTrainingRuningStatus(Training training) async {
  //   await isar!.writeTxn(() async {
  //     isar!.trainings.put(training);
  //   });
  //   _trainings.add(training);
  // }

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
