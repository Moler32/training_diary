import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:training_diary/core/generated/translations/locale_keys.g.dart';
import 'package:training_diary/src/ui/widgets/buttons/add_button.dart';
import 'package:training_diary/src/ui/widgets/buttons/clear_button.dart';
import 'package:training_diary/src/ui/widgets/text_fields/exercise_add_text_field.dart';

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

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          scrollable: true,
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ExersiceAddTextField(
                hintText: LocaleKeys.name.tr(),
                controller: titleController,
              ),
              ExersiceAddTextField(
                hintText: LocaleKeys.weight.tr(),
                controller: weightController,
              ),
              ExersiceAddTextField(
                hintText: LocaleKeys.time.tr(),
                controller: timeController,
              ),
              ExersiceAddTextField(
                hintText: LocaleKeys.sets.tr(),
                controller: setsController,
              ),
              ExersiceAddTextField(
                hintText: LocaleKeys.reps.tr(),
                controller: repsController,
              ),
              ExersiceAddTextField(
                hintText: LocaleKeys.description.tr(),
                controller: descriptionController,
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClearButton(
                  onTap: onFirstButtonTap,
                  text: firstButtonText ?? '',
                ),
                AddButton(
                  onTap: onSecondButtonTap,
                  text: secondButtonText,
                ),
              ],
            ),
          ],
        ),
      );
}
