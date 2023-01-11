import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:training_diary/core/navigation/main_router.dart';
import 'package:training_diary/src/cubit/exercises_cubit/exercises_cubit.dart'
    as exercises_cubit;

import '../../../cubit/exercises_cubit/exercises_cubit.dart';
import '../../../models/trainings/training_model.dart';

class ExercisesAppBar extends StatefulWidget implements PreferredSizeWidget {
  ExercisesAppBar(
      {super.key,
      this.title,
      this.height = 60,
      this.training,
      required this.index})
      : preferredSize = Size.fromHeight(height);

  @override
  final Size preferredSize;
  final String? title;
  final double height;
  final Training? training;
  final int index;

  @override
  State<ExercisesAppBar> createState() => _ExercisesAppBarState();
}

class _ExercisesAppBarState extends State<ExercisesAppBar> {
  late final exercises_cubit.ExercisesCubit _exercisesCubit;

  late TextEditingController _controller;
  String? title;
  int? sets = 2;
  int? reps = 4;
  int? weight = 70;
  String? time = '3 mib';
  String? description = 'Description';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _exercisesCubit = context.read<exercises_cubit.ExercisesCubit>();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: BlocConsumer<ExercisesCubit, ExercisesState>(
            bloc: _exercisesCubit,
            listener: (context, state) {},
            builder: (context, state) {
              return state.maybeWhen(addExercise: () {
                return IconButton(
                  splashRadius: 30,
                  onPressed: () {
                    openDialog();
                    // _exercisesCubit.addExercise(
                    //     Exercise(
                    //         title: _controller.text,
                    //         weight: weight,
                    //         time: time,
                    //         sets: sets,
                    //         reps: reps,
                    //         description: description),
                    //     widget.training!);
                  },
                  icon: const Icon(Icons.add),
                );
              }, orElse: () {
                return IconButton(
                  splashRadius: 30,
                  onPressed: () {
                    openDialog();
                    // _exercisesCubit.addExercise(
                    //     Exercise(
                    //         title: _controller.text,
                    //         weight: weight,
                    //         time: time,
                    //         sets: sets,
                    //         reps: reps,
                    //         description: description),
                    //     widget.training!);
                  },
                  icon: const Icon(Icons.add),
                );
              });
            },
          ),
        ),
      ],
      title: Text(widget.title ?? ''),
    );
  }

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Введите название eупражнения(например "Становая тяга")'),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: 'Введите название'),
            controller: _controller,
            onSubmitted: (_) => _addExercise(
                Exercise(
                  title: _controller.text,
                  weight: weight,
                  time: time,
                  sets: sets,
                  reps: reps,
                  description: description,
                ),
                widget.training!),
          ),
          actions: [
            TextButton(
              onPressed: () => _addExercise(
                Exercise(
                    title: _controller.text,
                    weight: weight,
                    time: time,
                    sets: sets,
                    reps: reps,
                    description: description),
                widget.training!,
              ),
              child: Text('Добавить'),
            ),
          ],
        ),
      );

  void _addExercise(Exercise exercise, Training training) {
    MainRouter().pop(_controller.text);
    // context.read<IsarProvider>().addExercise(exercise, training);
    _exercisesCubit.addExercise(exercise, training);

    _controller.clear();
  }
}
