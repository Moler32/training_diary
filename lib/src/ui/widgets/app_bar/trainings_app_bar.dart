import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:training_diary/core/generated/translations/locale_keys.g.dart';
import 'package:training_diary/core/navigation/router.gr.dart';
import '../../../../core/navigation/main_router.dart';
import '../../../cubit/trainings_cubit/trainings_cubit.dart' as trainings_cubit;
import '../../../models/trainings/training_model.dart';
import '../adding_form/add_traininging_form.dart';

class TrainingsAppBar extends StatefulWidget implements PreferredSizeWidget {
  TrainingsAppBar({
    super.key,
    this.title,
    this.height = 60,
  }) : preferredSize = Size.fromHeight(height);

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

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _weekDayController = TextEditingController();
    _trainingsCubit = context.read<trainings_cubit.TrainingsCubit>();
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
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          splashRadius: 30,
          onPressed: () {
            MainRouter().push(const ProfileRoute());
          },
          icon: const Icon(Icons.settings),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
              IconButton(
                splashRadius: 30,
                onPressed: () => showAddingForm(
                  firstButtonText: LocaleKeys.clear.tr(),
                  secondButtonText: LocaleKeys.add.tr(),
                  onFirstButtonTap: _clearTextField,
                  onSecondButtonTap: () => _addTraining(
                    Training(
                      _titleController.text,
                      _weekDayController.text,
                      [],
                    ),
                  ),
                ),
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TalkerScreen(
                        talker: GetIt.I<Talker>(),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.document_scanner_outlined),
              )
            ],
          ),
        ),
      ],
      title: Text(
        LocaleKeys.trainingDiary.tr(),
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  void showAddingForm({
    required Function() onSecondButtonTap,
    String? firstButtonText,
    String? secondButtonText,
    Function()? onFirstButtonTap,
  }) {
    AddTrainingForm(
            title: LocaleKeys.enterTrainingAndDay.tr(),
            firstButtonText: firstButtonText,
            onFirstButtonTap: onFirstButtonTap,
            titleController: _titleController,
            weekDayController: _weekDayController,
            context: context,
            secondButtonText: secondButtonText ?? '',
            onSecondButtonTap: onSecondButtonTap)
        .openDialog();
  }

  void _addTraining(Training training) {
    MainRouter().pop();
    if (_titleController.text.isNotEmpty) {
      _trainingsCubit.addTraining(training);
    }
    _titleController.clear();
    _weekDayController.clear();
  }

  void _clearTextField() {
    _titleController.clear();
    _weekDayController.clear();
  }
}
