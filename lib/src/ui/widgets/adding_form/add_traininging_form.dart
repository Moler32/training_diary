import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:training_diary/core/generated/translations/locale_keys.g.dart';
import 'package:training_diary/src/ui/widgets/buttons/add_button.dart';
import 'package:training_diary/src/ui/widgets/buttons/clear_button.dart';
import 'package:training_diary/src/ui/widgets/text_fields/training_add_text_field.dart';

class AddTrainingForm {
  const AddTrainingForm({
    required this.title,
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
  final String title;

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          scrollable: true,
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          content: Column(
            children: [
              TrainingAddTextField(
                hintText: LocaleKeys.name.tr(),
                controller: titleController,
              ),
              TrainingAddTextField(
                hintText: LocaleKeys.day.tr(),
                controller: weekDayController,
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
