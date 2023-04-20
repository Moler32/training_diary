import 'package:training_diary/src/data_sources/isar_db/isar.dart';

import '../../models/trainings/training_model.dart';

abstract class TrainingsRepository {
  void saveTraining(Training training);
  void deleteTraining(Training training);
  void renameTraining(Training training);
}

class TrainingsRepositoryImpl extends TrainingsRepository {
  final IsarDB isarDB;

  TrainingsRepositoryImpl(this.isarDB);
  @override
  void deleteTraining(Training training) {
    isarDB.deleteTraining(training);
  }

  @override
  void renameTraining(Training training) {
    isarDB.editTraining(training);
  }

  @override
  void saveTraining(Training training) {
    isarDB.addTraining(training);
  }
}
