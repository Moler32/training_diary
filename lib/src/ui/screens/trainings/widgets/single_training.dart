import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              colors: [
                Color(0xff1f005c),
                Color(0xff5b0060),
                Color(0xff870160),
                Color(0xffac255e),
                Color(0xffca485c),
                Color(0xffe16b5c),
                Color(0xfff39060),
                Color(0xffffb56b),
              ],
            )),
        width: double.infinity,
        height: 150,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              MainRouter()
                  .push(
                      ExercisesRoute(title: widget.title, index: widget.index))
                  .then((value) => _trainingsCubit.fetchTrainings());
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
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              _popUpMenuItem(
                value: 'Изменить',
                onTap: () {
                  widget.onChangeTapped?.call();
                },
              ),
              _popUpMenuItem(
                value: 'Удалить',
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
        Text(widget.weekDay),
        Row(
          children: [
            Text('${widget.exercises.length}',
                style: const TextStyle(fontSize: 26)),
            const SizedBox(
              width: 5,
            ),
            const Icon(Icons.fitness_center),
          ],
        ),
      ],
    );
  }
}
