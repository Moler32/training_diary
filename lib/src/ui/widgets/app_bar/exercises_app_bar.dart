import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:training_diary/core/generated/translations/locale_keys.g.dart';
import 'package:training_diary/core/navigation/main_router.dart';
import 'package:training_diary/src/cubit/exercises_cubit/exercises_cubit.dart'
    as exercises_cubit;
import 'package:training_diary/src/ui/widgets/buttons/negative_button.dart';
import 'package:training_diary/src/ui/widgets/buttons/positive_button.dart';
import 'package:training_diary/src/ui/widgets/mixins/show_exercise_adding_form.dart';
import 'package:training_diary/src/ui/widgets/stopwatch/stopwatch_model.dart';
import '../../../data_sources/isar_db/training_isar.dart';
import '../../../models/trainings/training_model.dart';

class ExercisesAppBar extends StatefulWidget implements PreferredSizeWidget {
  ExercisesAppBar({
    super.key,
    this.title,
    this.height = 60,
    this.training,
    required this.index,
    required this.stopWatchModel,
  }) : preferredSize = Size.fromHeight(height);

  @override
  final Size preferredSize;
  final String? title;
  final double height;
  final Training? training;
  final int index;
  final StopWatchModel stopWatchModel;

  @override
  State<ExercisesAppBar> createState() => _ExercisesAppBarState();
}

class _ExercisesAppBarState extends State<ExercisesAppBar>
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
        context.watch<IsarDB>().trainings.elementAt(widget.index);
    return WillPopScope(
      child: AppBar(
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              splashRadius: 30,
              onPressed: () {
                showAddingForm(
                    context: context,
                    descriptionController: _descriptionController,
                    setsController: _setsController,
                    repsController: _repsController,
                    timeController: _timeController,
                    titleController: _titleController,
                    weightController: _weightController,
                    onFirstButtonTap: _clearTextField,
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
                    secondButtonText: LocaleKeys.add.tr());
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ],
        title: Text(widget.title ?? ''),
        // )),
      ),
      onWillPop: () async {
        if (!widget.stopWatchModel.canClose &
            !widget.stopWatchModel.timerPaused) {
          return true;
        }

        final value = await showDialog<bool>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Выйти из тренировки?',
                ),
                actions: <Widget>[
                  NegativeButton(
                    text: 'Нет',
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  PositiveButton(
                    text: 'Да',
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            });
        return value == true;
      },
    );
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
}
