import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/navigation/main_router.dart';
import '../../../cubit/trainings_cubit/trainings_cubit.dart' as trainings_cubit;
import '../../../data_sources/provider/isar_provider.dart';
import '../../../models/trainings/training_model.dart';
import '../../../repositories/trainings/trainings_repositiry.dart';
import '../adding_form/add_traininging_form.dart';

class TrainingsAppBar extends StatefulWidget implements PreferredSizeWidget {
  TrainingsAppBar({super.key, this.title, this.height = 60})
      : preferredSize = Size.fromHeight(height);

  @override
  final Size preferredSize;
  final String? title;
  final double height;

  @override
  State<TrainingsAppBar> createState() => _TrainingsAppBarState();
}

class _TrainingsAppBarState extends State<TrainingsAppBar> {
  late final trainings_cubit.TrainingsCubit _trainingsCubit;

  late TextEditingController _titleController;
  late TextEditingController _weekDayController;

  List<Exercise>? exercises = [];

  // late final TrainingsRepositoryImpl trainingsRepository;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _weekDayController = TextEditingController();
    _trainingsCubit = context.read<trainings_cubit.TrainingsCubit>();
    // final isarProvider = IsarProvider();
    // trainingsRepository = TrainingsRepositoryImpl(isarProvider);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _weekDayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          splashRadius: 30,
          onPressed: () {},
          icon: const Icon(Icons.settings),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            splashRadius: 30,
            onPressed: () async {
              // await AddTrainingForm(
              //         context: context, secondButtonText: 'Добавить')
              //     .openDialog(_titleController, _weekDayController);
            },
            icon: const Icon(Icons.add),
          ),
        ),
      ],
      title: Text(widget.title ?? ''),
    );
  }

  // Future<String?> openDialog() => showDialog<String>(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: const Text(
  //             'Введите название тренировки(например: "Спина - плечи") и день недели:'),
  //         content: Wrap(children: [
  //           Column(
  //             children: [
  //               TextFormField(
  //                 autofocus: true,
  //                 decoration: const InputDecoration(hintText: 'Название'),
  //                 controller: _titleController,
  //               ),
  //               TextFormField(
  //                 autofocus: true,
  //                 decoration: const InputDecoration(hintText: 'День недели'),
  //                 controller: _weekDayController,
  //               ),
  //             ],
  //           ),
  //         ]),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               if (_weekDayController.text.isEmpty) {
  //                 _weekDayController.text = 'Не указано(день недели)';
  //               }
  //               _addTraining(Training(_titleController.text,
  //                   _weekDayController.text, exercises!));
  //             },
  //             child: const Text('Добавить'),
  //           ),
  //         ],
  //       ),
  //     );

  void _addTraining(Training training) {
    MainRouter().pop(_titleController.text);
    if (_titleController.text.isNotEmpty) {
      _trainingsCubit.addTraining(training);
    }
    _titleController.clear();
    _weekDayController.clear();
  }
}
