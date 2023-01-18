import 'package:flutter/material.dart';

class AddExerciseForm {
  AddExerciseForm({
    required this.context,
    required this.descriptionController,
    required this.repsController,
    required this.setsController,
    required this.timeController,
    required this.titleController,
    required this.weightController,
    required this.title,
    required this.firstButtonText,
    required this.secondButtonText,
    required this.onFirstButtonTap,
    required this.onSecondButtonTap,
  });

  final BuildContext context;
  final String title;
  final TextEditingController titleController,
      weightController,
      timeController,
      setsController,
      repsController,
      descriptionController;
  final String secondButtonText;
  final String? firstButtonText;
  final void Function()? onFirstButtonTap;
  final void Function() onSecondButtonTap;
  // final TextEditingController weightController;
  // final TextEditingController timeController;
  // final TextEditingController setsController;
  // final TextEditingController repsController;
  // final TextEditingController descriptionController;

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Column(
            children: [
              TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: 'Введите название'),
                controller: titleController,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: 'Введите вес'),
                controller: weightController,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: 'Введите время'),
                controller: timeController,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: 'Введите подходы'),
                controller: setsController,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: 'Введите повторения'),
                controller: repsController,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: 'Введите описание'),
                controller: descriptionController,
              ),
            ],
          ),
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
