import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data_sources/isar_db/isar.dart';
import '../../models/trainings/training_model.dart';
part 'stopwatch_state.dart';
part 'stopwatch_cubit.freezed.dart';

class StopwatchCubit extends Cubit<StopwatchState> {
  StopwatchCubit(this.isarDB) : super(const StopwatchState.start(Duration()));
  final IsarDB isarDB;

  Future<void> start(Training training) async {
    try {
      int time = DateTime.now().millisecondsSinceEpoch;
      final timeNow = DateTime.fromMillisecondsSinceEpoch(time);
      training.savedDataTime = timeNow;

      training.isTrainingStarted = true;

      await isarDB.saveTrainingRuningStatus(training);
      emit(const StopwatchState.loadingStopwatch());
      await Future.delayed(const Duration(milliseconds: 200));
      Timer.periodic(const Duration(seconds: 1), (timer) {
        Duration timeDifference =
            DateTime.now().difference(training.savedDataTime ?? DateTime.now());
        if (training.isTrainingStarted == true) {
          emit(StopwatchState.start(timeDifference));
        } else if (training.isTrainingStarted == false) {
          timer.cancel();
        }
      });
    } catch (e) {
      emit(StopwatchState.errorStopwatch(e.toString()));
    }
  }

  Future<void> stop(Training training) async {
    try {
      training.savedDataTime = DateTime.tryParse('0');

      training.isTrainingStarted = false;
      await isarDB.saveTrainingRuningStatus(training);
      emit(const StopwatchState.loadingStopwatch());
      await Future.delayed(const Duration(milliseconds: 200));
      Duration timeDifference = const Duration();
      emit(StopwatchState.stop(timeDifference));
    } catch (e) {
      emit(StopwatchState.errorStopwatch(e.toString()));
    }
  }

  // Future<List<Training>> _getTrainings() async {
  //   final trainings = await isarDB.fetchTrainings();
  //   return trainings;
  // }
}
