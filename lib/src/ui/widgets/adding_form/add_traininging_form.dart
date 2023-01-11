import 'package:flutter/material.dart';

import '../../../../core/navigation/main_router.dart';
import '../../../models/trainings/training_model.dart';

class AddTrainingForm {
  const AddTrainingForm({
    required this.firstButtonText,
    required this.titleController,
    required this.weekDayController,
    required this.onFirstButtonTap,
    required this.onSecondButtonTap,
    required this.secondButtonText,
    required this.context,
  });

  final BuildContext context;
  final String secondButtonText;
  final String? firstButtonText;
  final void Function()? onFirstButtonTap;
  final void Function() onSecondButtonTap;
  final TextEditingController titleController;
  final TextEditingController weekDayController;

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Введите название тренировки и день недели:'),
          content: Wrap(children: [
            Column(
              children: [
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(hintText: 'Название'),
                  controller: titleController,
                ),
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(hintText: 'День недели'),
                  controller: weekDayController,
                ),
              ],
            ),
          ]),
          actions: [
            TextButton(
              onPressed: onFirstButtonTap,
              child: Text(firstButtonText ?? ''),
            ),
            TextButton(
              onPressed: onSecondButtonTap,
              child: Text(secondButtonText),
            ),
          ],
        ),
      );
}
