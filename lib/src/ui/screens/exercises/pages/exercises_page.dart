import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:training_diary/core/di/injection.dart';
import 'package:training_diary/core/generated/translations/locale_keys.g.dart';
import 'package:training_diary/src/cubit/exercises_cubit/exercises_cubit.dart'
    as exercises_cubit;
import 'package:training_diary/src/ui/widgets/mixins/show_exercise_adding_form.dart';
import 'package:training_diary/src/ui/widgets/stopwatch/stopwatch.dart';
import 'package:training_diary/src/ui/widgets/stopwatch/stopwatch_model.dart';
import '../../../../../core/navigation/main_router.dart';
import '../../../../cubit/exercises_cubit/exercises_cubit.dart';
import '../../../../data_sources/isar_db/training_isar.dart';
import '../../../../models/trainings/training_model.dart';
import '../../../widgets/app_bar/exercises_app_bar.dart';
import '../../../widgets/buttons/empty_list_add_button.dart';
import '../widgets/single_exercise.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({
    super.key,
    this.title,
    required this.index,
    required this.training,
  });

  final String? title;
  final int index;
  final Training training;

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage>
    with ShowExerciseAddingForm {
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
    final training = getIt<IsarDB>().trainings.elementAt(widget.index);

    return ChangeNotifierProvider(
      create: (context) => StopWatchModel(context),
      child: Consumer<StopWatchModel>(
        builder: (context, stopWatchModel, child) => Scaffold(
          appBar: ExercisesAppBar(
            stopWatchModel: stopWatchModel,
            title: widget.title,
            index: widget.index,
            training: training,
          ),
          body: BlocConsumer<ExercisesCubit, ExercisesState>(
            bloc: _exercisesCubit,
            listener: (context, state) {
              state.maybeWhen(
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
                },
                orElse: () {},
              );
            },
            buildWhen: (prev, curr) {
              return curr is Error ||
                  curr is LoadedList ||
                  curr is EmptyList ||
                  curr is Loading;
            },
            builder: (context, state) {
              return state.maybeWhen(
                emtyList: () {
                  return Column(
                    children: [
                      Expanded(
                        child: EmptyListAddButton(
                          title: LocaleKeys.addExercise.tr(),
                          onPressed: () {
                            showAddingForm(
                              context: context,
                              descriptionController: _descriptionController,
                              setsController: _setsController,
                              repsController: _repsController,
                              timeController: _timeController,
                              titleController: _titleController,
                              weightController: _weightController,
                              onFirstButtonTap: () => _clearTextField(),
                              firstButtonText: LocaleKeys.clear.tr(),
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
                              secondButtonText: LocaleKeys.add.tr(),
                            );
                          },
                        ),
                      ),
                    ],
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
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          alignment: Alignment.centerRight,
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () => _clearExersiceStatus(),
                            child: Text(
                              LocaleKeys.resetStatus.tr(),
                            ),
                          ),
                        ),
                      ),
                      _buildExercisesList(exercises, training),
                      StopWatch(
                        stopWatchModel: stopWatchModel,
                      ),
                    ],
                  );
                },
                orElse: () {
                  return Container();
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildExercisesList(List<Exercise> exercises, Training training) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ReorderableListView.builder(
          onReorderStart: (index) => HapticFeedback.heavyImpact(),
          onReorder: (int oldIndex, int newIndex) {
            _exercisesCubit.reorderableExercise(
                training, widget.index, oldIndex, newIndex);
          },
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            return Column(
              key: ValueKey(index),
              children: [
                SingleExercise(
                  index: index,
                  key: ValueKey(index),
                  exercises: exercises,
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
                  onSwapLeft: () => _deleteExercise(
                    training,
                    exercises[index],
                  ),
                  onSwapRight: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _titleController.text = exercises[index].title ?? '';
                      _setsController.text = exercises[index].sets ?? '';
                      _repsController.text = exercises[index].reps ?? '';
                      _weightController.text = exercises[index].weight ?? '';
                      _timeController.text = exercises[index].time ?? '';
                      _descriptionController.text =
                          exercises[index].description ?? '';
                      showAddingForm(
                        context: context,
                        descriptionController: _descriptionController,
                        setsController: _setsController,
                        repsController: _repsController,
                        timeController: _timeController,
                        titleController: _titleController,
                        weightController: _weightController,
                        firstButtonText: LocaleKeys.clear.tr(),
                        secondButtonText: LocaleKeys.change.tr(),
                        onFirstButtonTap: () => _clearTextField(),
                        onSecondButtonTap: () => _editExercise(training, index),
                      );
                    });
                  },
                ),
                // if (index < exercises.length - 1) const CustomDivider(),
                SizedBox(
                  height: 15,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _clearExersiceStatus() {
    for (int i = 0; i < widget.training.exercises.length; i++) {
      widget.training.exercises[i].isComlete = false;
    }
    _exercisesCubit.editExersice(widget.training, widget.index);
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(LocaleKeys.exerciseAdded
            .tr(args: ["\"${_titleController.text}\""])),
      ));
    }
    _clearTextField();
  }

  void _changeStatus(Exercise exercise, Training training) {
    _exercisesCubit.changeCopleteStatus(exercise, widget.index, training);
  }

  void _editExercise(Training training, int exersiceIndex) {
    MainRouter().pop();
    final exersise = training.exercises[exersiceIndex];
    exersise.title = _titleController.text;
    exersise.reps = _repsController.text;
    exersise.sets = _setsController.text;
    exersise.time = _timeController.text;
    exersise.weight = _weightController.text;
    exersise.description = _descriptionController.text;
    _exercisesCubit.editExersice(training, widget.index);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(LocaleKeys.exerciseChanged
          .tr(args: ["\"${_titleController.text}\""])),
    ));
  }

  void _deleteExercise(Training training, Exercise exercise) {
    _exercisesCubit.deleteExercise(training, exercise, widget.index);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content:
          Text(LocaleKeys.exerciseDeleted.tr(args: ["\"${exercise.title}\""])),
    ));
  }
}
