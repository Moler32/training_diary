import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:training_diary/src/data_sources/provider/isar_provider.dart';
import 'package:training_diary/src/models/trainings/training_model.dart';

import '../../data_sources/provider/isar_provider_listener.dart';

part 'exercises_state.dart';
part 'exercises_cubit.freezed.dart';

@injectable
class ExercisesCubit extends Cubit<ExercisesState> {
  ExercisesCubit(this.isarProvider) : super(const ExercisesState.loading());
  final IsarProvider isarProvider;

  List<Exercise> _exersises = [];

  Future<void> fetchExercises(int index) async {
    try {
      emit(const ExercisesState.loading());
      await Future.delayed(const Duration(milliseconds: 400));
      _exersises = isarProvider.fetchExercises(index);
      if (_exersises.isEmpty) {
        emit(const ExercisesState.emtyList());
      } else {
        emit(ExercisesState.loadedList(_exersises));
      }
    } catch (e) {
      emit(ExercisesState.error(e.toString()));
    }
  }

  Future<void> addExercise(Exercise exercise, Training training) async {
    try {
      // emit(ExercisesState.addExercise());
      isarProvider.addExercise(exercise, training);
    } catch (e) {
      emit(ExercisesState.error(e.toString()));
    }
  }

  Future<void> startWorkout(bool isPlaying) async {
    try {
      // emit(const ExercisesState.loading());
      await Future.delayed(const Duration(milliseconds: 500));
      emit(ExercisesState.startWorkout());
    } catch (e) {
      emit(ExercisesState.error(e.toString()));
    }
  }

  Future<void> stopWorkout(bool isPlaying) async {
    try {
      // emit(const ExercisesState.loading());
      await Future.delayed(const Duration(milliseconds: 500));
      emit(ExercisesState.stopWorkout());
    } catch (e) {
      emit(ExercisesState.error(e.toString()));
    }
  }

  // _listenExercisesChanges() {
  //   isarProvider.addListener(this);
  // }
}
