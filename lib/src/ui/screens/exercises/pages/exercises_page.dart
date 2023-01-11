import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:training_diary/src/cubit/exercises_cubit/exercises_cubit.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/navigation/main_router.dart';
import '../../../../data_sources/provider/isar_provider.dart';
import '../../../../models/trainings/training_model.dart';
import '../../../widgets/app_bar/exercises_app_bar.dart';
import '../../../widgets/buttons/empty_list_add_button.dart';
import '../widgets/single_exercise.dart';
import '../widgets/start_stop_workout_button.dart';

class ExersicesPage extends StatefulWidget {
  const ExersicesPage({super.key, this.title, required this.index});

  final String? title;
  final int index;

  @override
  State<ExersicesPage> createState() => _ExersicesPageState();
}

class _ExersicesPageState extends State<ExersicesPage> {
  final ExercisesCubit _exercisesCubit = getIt<ExercisesCubit>();

  @override
  void initState() {
    super.initState();
    _exercisesCubit.fetchExercises(widget.index);
  }

  @override
  void dispose() {
    _exercisesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Training training =
        context.watch<IsarProvider>().trainings.elementAt(widget.index);
    return Scaffold(
      appBar: ExercisesAppBar(
        title: widget.title,
        index: widget.index,
        training: training,
      ),
      body: BlocConsumer<ExercisesCubit, ExercisesState>(
        bloc: _exercisesCubit,
        listener: (context, state) {
          state.maybeWhen(
              error: (message) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              },
              // startWorkout: (isPlaying) {
              //   _exercisesCubit.startWorkout(isPlaying);
              // },
              // stopWorkout: (isPlaying) {
              //   _exercisesCubit.stopWorkout(isPlaying);
              // },
              orElse: () {});
        },
        // buildWhen: (previous, current) => previous != current,
        buildWhen: (prev, curr) {
          return curr is Error ||
              curr is LoadedList ||
              curr is EmptyList ||
              curr is Loading;
        },
        builder: (context, state) {
          return state.maybeWhen(
            emtyList: () {
              return EmptyListAddButton(
                title: 'Добавить упражнение',
                onPressed: () {},
              );
            },
            error: (String message) {
              return Center(
                child: Text(message),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            loadedList: (exersises) {
              return Column(
                children: [
                  _buildExercisesList(context, exersises),
                  _buildStartStopWorkoutButton(),
                ],
              );
            },
            orElse: () {
              return Text('orElse');
            },
          );
        },
      ),
    );
  }

  Widget _buildExercisesList(BuildContext context, List<Exercise> exercises) {
    // List<Exercise>? exercises =
    //     context.watch<IsarProvider>().trainings[widget.index].exercises;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            return SingleExercise(
              index: index,
              title: exercises[index].title,
              sets: exercises[index].sets,
              reps: exercises[index].reps,
              weight: exercises[index].weight,
              time: exercises[index].time,
              description: exercises[index].description,
            );
          },
        ),
      ),
    );
  }

  Widget _buildStartStopWorkoutButton() {
    return BlocConsumer<ExercisesCubit, ExercisesState>(
      bloc: _exercisesCubit,
      listener: (context, state) {},
      // buildWhen: (previous, current) => previous != current,
      buildWhen: (prev, curr) {
        return curr is StartWorkout || curr is StopWorkout;
      },
      builder: (context, state) {
        return state.maybeWhen(
          startWorkout: () {
            return _startStopWorkoutButton(
              isStarting: true,
            );
          },
          stopWorkout: (() {
            return _startStopWorkoutButton(
              isStarting: false,
            );
          }),
          orElse: _startStopWorkoutButton,
        );
      },
    );
  }

  Widget _startStopWorkoutButton({bool? isStarting, Function()? onTap}) {
    return StartStopWorkoutButton(
      isStarting: isStarting,
      onStartTap: () => _exercisesCubit.startWorkout(true),
      onStopTap: () => _exercisesCubit.stopWorkout(false),
      height: 60,
    );
  }
}
