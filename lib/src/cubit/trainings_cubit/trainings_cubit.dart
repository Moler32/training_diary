import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../data_sources/isar_db/isar.dart';
import '../../models/trainings/training_model.dart';

part 'trainings_state.dart';
part 'trainings_cubit.freezed.dart';

@injectable
class TrainingsCubit extends Cubit<TrainingsState> {
  TrainingsCubit(this.isarDB) : super(const TrainingsState.loading());
  //  {
  //   _listenTrainingsChanges();
  // }

  final IsarDB isarDB;

  List<Training> _trainings = [];

  // void _listenTrainingsChanges() {
  //   isarProvider.addListener(this);
  // }

  // Future<void> _refreshAllTrainings() async {
  //   isarProvider.onUpdateAllTrainings();
  // }

  Future<List<Training>> _getTrainings() async {
    _trainings = await isarDB.fetchTrainings();
    return _trainings;
  }

  Future<void> fetchTrainings() async {
    try {
      emit(const TrainingsState.loading());
      Future.delayed(const Duration(milliseconds: 400));
      await _getTrainings();
      if (_trainings.isEmpty) {
        emit(const TrainingsState.emptyList());
      } else {
        emit(TrainingsState.loaded(_trainings));
      }
    } catch (e, st) {
      emit(TrainingsState.error(e.toString()));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  Future<void> addTraining(Training training) async {
    try {
      await isarDB.addTraining(training);
      await _getTrainings();
      emit(TrainingsState.loaded(_trainings));
    } catch (e, st) {
      emit(TrainingsState.error(e.toString()));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  Future<void> deleteTraining(Training training) async {
    try {
      await isarDB.deleteTraining(training);
      await _getTrainings();
      if (_trainings.isNotEmpty) {
        emit(TrainingsState.loaded(_trainings));
      } else {
        emit(const TrainingsState.emptyList());
      }
    } catch (e, st) {
      emit(TrainingsState.error(e.toString()));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  Future<void> renameTraining(Training training) async {
    try {
      await isarDB.editTraining(training);
      await _getTrainings();
      emit(TrainingsState.loaded(_trainings));
    } catch (e, st) {
      emit(TrainingsState.error(e.toString()));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
