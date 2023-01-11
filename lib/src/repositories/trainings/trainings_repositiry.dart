import 'package:flutter/material.dart';
import 'package:training_diary/src/data_sources/provider/isar_provider.dart';

import '../../../core/navigation/main_router.dart';
import '../../models/trainings/training_model.dart';

abstract class TrainingsRepository {
  void saveTraining(Training training);
  void deleteTraining(Training training);
  void renameTraining(Training training);
}

class TrainingsRepositoryImpl extends TrainingsRepository {
  final IsarProvider isarProvider;

  TrainingsRepositoryImpl(this.isarProvider);
  @override
  void deleteTraining(Training training) {
    isarProvider.deleteTraining(training);
  }

  @override
  void renameTraining(Training training) {
    isarProvider.renameTraining(training);
  }

  @override
  void saveTraining(Training training) {
    // MainRouter().pop(_controller.text);
    isarProvider.addTraining(training);
    // _controller.clear();
  }
}
