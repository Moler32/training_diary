import 'package:injectable/injectable.dart';
import 'package:training_diary/src/data_sources/isar_db/training_isar.dart';

import '../../models/trainings/training_model.dart';

abstract class TrainingsRepository {
  Future<List<Training>> fetchTrainings();
  Future<void> addTraining(Training training);
  Future<void> deleteTraining(Training training);
  Future<void> editTraining(Training training);
}

@LazySingleton(as: TrainingsRepository)
class TrainingsRepositoryImpl extends TrainingsRepository {
  TrainingsRepositoryImpl(this.isarDB);
  final IsarDB isarDB;

  @override
  Future<List<Training>> fetchTrainings() async {
    final trainings = await isarDB.fetchTrainings();
    return trainings;
  }

  @override
  Future<void> deleteTraining(Training training) async {
    await isarDB.deleteTraining(training);
  }

  @override
  Future<void> editTraining(Training training) async {
    await isarDB.editTraining(training);
  }

  @override
  Future<void> addTraining(Training training) async {
    await isarDB.addTraining(training);
  }
}
