import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data_sources/provider/isar_provider.dart';
import '../../data_sources/provider/isar_provider_listener.dart';
import '../../models/trainings/training_model.dart';

part 'trainings_state.dart';
part 'trainings_cubit.freezed.dart';

@injectable
class TrainingsCubit extends Cubit<TrainingsState> with IsarReposytoryListener {
  TrainingsCubit(this.isarProvider) : super(const TrainingsState.loading());
  //  {
  //   _listenTrainingsChanges();
  // }

  final IsarProvider isarProvider;

  List<Training> _trainings = [];

  // void _listenTrainingsChanges() {
  //   isarProvider.addListener(this);
  // }

  // Future<void> _refreshAllTrainings() async {
  //   isarProvider.onUpdateAllTrainings();
  // }

  Future<List<Training>> _getTrainings() async {
    _trainings = await isarProvider.fetchTrainings();
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
    } catch (e) {
      emit(TrainingsState.error(e.toString()));
    }
  }

  Future<void> addTraining(Training training) async {
    try {
      await isarProvider.addTraining(training);
      await _getTrainings();
      emit(TrainingsState.loaded(_trainings));
    } catch (e) {
      emit(TrainingsState.error(e.toString()));
    }
  }

  Future<void> deleteTraining(Training training) async {
    try {
      await isarProvider.deleteTraining(training);
      await _getTrainings();
      if (_trainings.isNotEmpty) {
        emit(TrainingsState.loaded(_trainings));
      } else {
        emit(const TrainingsState.emptyList());
      }
    } catch (e) {
      emit(TrainingsState.error(e.toString()));
    }
  }

  Future<void> renameTraining(Training training) async {
    try {
      await isarProvider.renameTraining(training);
      await _getTrainings();
      emit(TrainingsState.loaded(_trainings));
    } catch (e) {
      emit(TrainingsState.error(e.toString()));
    }
  }
}
