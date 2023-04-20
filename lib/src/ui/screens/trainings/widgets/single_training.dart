import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:training_diary/core/di/injection.dart';
import 'package:training_diary/core/generated/translations/locale_keys.g.dart';
import 'package:training_diary/core/styles/theme/constants.dart';
import 'package:training_diary/src/cubit/stopwatch_cubit/stopwatch_cubit.dart';
import 'package:training_diary/src/data_sources/isar_db/isar.dart';
import '../../../../../core/navigation/main_router.dart';
import '../../../../../core/navigation/router.gr.dart';
import '../../../../cubit/trainings_cubit/trainings_cubit.dart'
    as trainings_cubit;
import '../../../../models/trainings/training_model.dart';

class SingleTraining extends StatefulWidget {
  const SingleTraining({
    super.key,
    required this.title,
    required this.weekDay,
    required this.exercises,
    required this.training,
    required this.index,
    this.onChangeTapped,
    this.onDeleteTapped,
  });

  final Training training;
  final String title;
  final String weekDay;
  final List<Exercise> exercises;
  final int index;
  final void Function()? onChangeTapped;
  final Function()? onDeleteTapped;

  @override
  State<SingleTraining> createState() => _SingleTrainingState();
}

class _SingleTrainingState extends State<SingleTraining> {
  late final trainings_cubit.TrainingsCubit _trainingsCubit;
  final StopwatchCubit _stopwatchCubit = StopwatchCubit(getIt<IsarDB>());
  @override
  void initState() {
    super.initState();
    _trainingsCubit = context.read<trainings_cubit.TrainingsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: widget.title);
    final weekDayController = TextEditingController(text: widget.weekDay);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: trainingColors,
            )),
        width: double.infinity,
        height: 150,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              MainRouter()
                  .push(ExercisesRoute(
                      stopwatchCubit: _stopwatchCubit,
                      title: widget.title,
                      index: widget.index,
                      training: widget.training))
                  .then(
                    (value) => _trainingsCubit.fetchTrainings(),
                  );
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTitleRow(context, titleController, weekDayController),
                  _buildWeekDayRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleRow(
      BuildContext context,
      TextEditingController titleController,
      TextEditingController weekDayController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 24),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              _popUpMenuItem(
                value: LocaleKeys.change.tr(),
                onTap: () {
                  widget.onChangeTapped?.call();
                },
              ),
              _popUpMenuItem(
                value: LocaleKeys.delete.tr(),
                onTap: () {
                  widget.onDeleteTapped?.call();
                },
              ),
            ];
          },
        )
      ],
    );
  }

  PopupMenuItem _popUpMenuItem({
    void Function()? onTap,
    required String value,
  }) {
    return PopupMenuItem(
      onTap: onTap,
      child: Text(value),
    );
  }

  Widget _buildWeekDayRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.weekDay,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          children: [
            Text('${widget.exercises.length}',
                style: const TextStyle(
                  fontSize: 26,
                )),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.fitness_center,
            ),
          ],
        ),
      ],
    );
  }
}
