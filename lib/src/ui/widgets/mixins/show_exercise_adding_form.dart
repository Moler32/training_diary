import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:training_diary/core/generated/translations/locale_keys.g.dart';
import 'package:training_diary/src/ui/widgets/adding_form/add_exercise_form.dart';

mixin ShowExerciseAddingForm {
  void showAddingForm({
    required Function() onSecondButtonTap,
    String? firstButtonText,
    String? secondButtonText,
    Function()? onFirstButtonTap,
    required BuildContext context,
    required TextEditingController descriptionController,
    required TextEditingController repsController,
    required TextEditingController setsController,
    required TextEditingController timeController,
    required TextEditingController weightController,
    required TextEditingController titleController,
  }) {
    AddExerciseForm(
      context: context,
      descriptionController: descriptionController,
      repsController: repsController,
      setsController: setsController,
      timeController: timeController,
      title: LocaleKeys.enterExercise.tr(),
      titleController: titleController,
      weightController: weightController,
      firstButtonText: firstButtonText,
      onFirstButtonTap: onFirstButtonTap,
      secondButtonText: secondButtonText ?? '',
      onSecondButtonTap: onSecondButtonTap,
    ).openDialog();
  }
}
