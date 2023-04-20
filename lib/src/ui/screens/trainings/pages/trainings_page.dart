import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_diary/core/generated/translations/locale_keys.g.dart';
import '../../../../../core/navigation/main_router.dart';
import '../../../../cubit/trainings_cubit/trainings_cubit.dart';
import '../../../../models/trainings/training_model.dart';
import '../../../widgets/adding_form/add_traininging_form.dart';
import '../../../widgets/app_bar/trainings_app_bar.dart';
import '../../../widgets/buttons/empty_list_add_button.dart';
import '../widgets/single_training.dart';

class TrainingsPage extends StatefulWidget {
  const TrainingsPage({
    super.key,
  });

  @override
  State<TrainingsPage> createState() => _TrainingsPageState();
}

class _TrainingsPageState extends State<TrainingsPage> {
  late TrainingsCubit _trainingsCubit;
  late TextEditingController _titleController;
  late TextEditingController _weekDayController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _weekDayController = TextEditingController();
    _trainingsCubit = context.read<TrainingsCubit>();
    _trainingsCubit.fetchTrainings();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _weekDayController.dispose();
    _trainingsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TrainingsAppBar(),
      body: BlocConsumer<TrainingsCubit, TrainingsState>(
        bloc: _trainingsCubit,
        listener: (context, state) {
          state.maybeWhen(
              error: (message) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              },
              orElse: () {});
        },
        buildWhen: (prev, curr) {
          return curr is Error ||
              curr is Loaded ||
              curr is EmptyList ||
              curr is Loading;
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            loaded: (trainings) {
              return _buildTrainingsList(trainings);
            },
            emptyList: () {
              return EmptyListAddButton(
                title: LocaleKeys.addTraining.tr(),
                onPressed: () => _showAddingForm(
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
              );
            },
            error: (message) {
              return Center(
                child: Text(message),
              );
            },
            orElse: () {
              return Container();
            },
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //     child: const Icon(Icons.add),
      //     onPressed: () => _showAddingForm(
      //           firstButtonText: 'Очистить',
      //           secondButtonText: 'Добавить',
      //           onFirstButtonTap: _clearTextField,
      //           onSecondButtonTap: () => _addTraining(Training(
      //               _titleController.text, _weekDayController.text, [])),
      //         )),
    );
  }

  Widget _buildTrainingsList(List<Training> trainings) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      itemCount: trainings.length,
      itemBuilder: ((context, index) {
        return SingleTraining(
          index: index,
          key: ValueKey(index),
          training: trainings[index],
          title: trainings[index].title!,
          weekDay: trainings[index].weekDay!,
          exercises: trainings[index].exercises,
          onChangeTapped: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _titleController.text = trainings[index].title ?? '';
              _weekDayController.text = trainings[index].weekDay ?? '';
              _showAddingForm(
                firstButtonText: LocaleKeys.clear.tr(),
                secondButtonText: LocaleKeys.change.tr(),
                onFirstButtonTap: _clearTextField,
                onSecondButtonTap: () => _editTraining(trainings[index]),
              );
            });
          },
          onDeleteTapped: () => _deleteTraining(trainings[index]),
        );
      }),
    );
  }

  void _showAddingForm({
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

  void _clearTextField() {
    _titleController.clear();
    _weekDayController.clear();
  }

  void _addTraining(Training training) {
    MainRouter().pop();
    if (_titleController.text.isNotEmpty) {
      _trainingsCubit.addTraining(training);
    }
    _clearTextField();
  }

  void _editTraining(Training training) {
    MainRouter().pop();
    training.title = _titleController.text;
    training.weekDay = _weekDayController.text;
    _trainingsCubit.renameTraining(training);
    _titleController.clear();
    _weekDayController.clear();
  }

  void _deleteTraining(Training training) {
    _trainingsCubit.deleteTraining(training);
  }
}
