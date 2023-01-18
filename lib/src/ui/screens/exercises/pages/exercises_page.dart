import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_diary/src/cubit/exercises_cubit/exercises_cubit.dart'
    as exercises_cubit;
import '../../../../../core/di/injection.dart';
import '../../../../../core/navigation/main_router.dart';
import '../../../../cubit/exercises_cubit/exercises_cubit.dart';
import '../../../../data_sources/provider/isar_provider.dart';
import '../../../../models/trainings/training_model.dart';
import '../../../widgets/adding_form/add_exercise_form.dart';
import '../../../widgets/app_bar/exercises_app_bar.dart';
import '../../../widgets/buttons/empty_list_add_button.dart';
import '../widgets/divider.dart';
import '../widgets/single_exercise.dart';
import '../widgets/start_stop_workout_button.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({super.key, this.title, required this.index});

  final String? title;
  final int index;

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  late final exercises_cubit.ExercisesCubit _exercisesCubit;

  late TextEditingController _titleController;
  late TextEditingController _setsController;
  late TextEditingController _repsController;
  late TextEditingController _timeController;
  late TextEditingController _weightController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _setsController = TextEditingController();
    _repsController = TextEditingController();
    _timeController = TextEditingController();
    _weightController = TextEditingController();
    _descriptionController = TextEditingController();
    _exercisesCubit = context.read<exercises_cubit.ExercisesCubit>();
    _exercisesCubit.fetchExercises(widget.index);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _setsController.dispose();
    _repsController.dispose();
    _timeController.dispose();
    _weightController.dispose();
    _descriptionController.dispose();
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
                onPressed: () {
                  showAddingForm(
                      onFirstButtonTap: _clearTextField,
                      firstButtonText: 'Очистить',
                      onSecondButtonTap: () {
                        _addExercise(
                            Exercise(
                              title: _titleController.text,
                              sets: _setsController.text,
                              reps: _repsController.text,
                              weight: _weightController.text,
                              time: _timeController.text,
                              description: _descriptionController.text,
                              isComlete: false,
                            ),
                            training,
                            widget.index);
                      },
                      secondButtonText: 'Добавить');
                },
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
            loadedList: (exercises) {
              return Column(
                children: [
                  _buildExercisesList(exercises, training),
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

  Widget _buildExercisesList(List<Exercise> exercises, Training training) {
    // List<Exercise>? exercises =
    //     context.watch<IsarProvider>().trainings[widget.index].exercises;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView.separated(
          separatorBuilder: (context, index) => const CustomDivider(),
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            return SingleExercise(
              index: index,
              key: ValueKey(index),
              title: exercises[index].title,
              sets: exercises[index].sets,
              reps: exercises[index].reps,
              weight: exercises[index].weight,
              time: exercises[index].time,
              description: exercises[index].description,
              isComplete: exercises[index].isComlete,
              onTapCheckbox: () {
                _changeStatus(exercises[index], training);
              },
              onSwapLeft: () => _deleteExercise(training, exercises[index]),
              onSwapRight: () => _editExercise(),
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
            return _startStopWorkoutButton(isStarting: true);
          },
          stopWorkout: (() {
            return _startStopWorkoutButton(isStarting: false);
          }),
          orElse: () {
            return Text('orElse');
          },
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

  void showAddingForm({
    required Function() onSecondButtonTap,
    String? firstButtonText,
    String? secondButtonText,
    Function()? onFirstButtonTap,
  }) {
    AddExerciseForm(
      context: context,
      descriptionController: _descriptionController,
      repsController: _repsController,
      setsController: _setsController,
      timeController: _timeController,
      title: 'Введите название упражнения',
      titleController: _titleController,
      weightController: _weightController,
      firstButtonText: firstButtonText,
      onFirstButtonTap: onFirstButtonTap,
      secondButtonText: secondButtonText ?? '',
      onSecondButtonTap: onSecondButtonTap,
    ).openDialog();
  }

  void _clearTextField() {
    _titleController.clear();
    _weightController.clear();
    _timeController.clear();
    _setsController.clear();
    _repsController.clear();
    _descriptionController.clear();
  }

  void _addExercise(Exercise exercise, Training training, int index) {
    MainRouter().pop();
    if (_titleController.text.isNotEmpty) {
      _exercisesCubit.addExercise(exercise, training, index);
    }
    _clearTextField();
  }

  void _changeStatus(Exercise exercise, Training training) {
    _exercisesCubit.changeCopleteStatus(exercise, widget.index, training);
  }

  void _editExercise() {}

  void _deleteExercise(Training training, Exercise exercise) {
    _exercisesCubit.deleteExercise(training, exercise, widget.index);
  }
}
