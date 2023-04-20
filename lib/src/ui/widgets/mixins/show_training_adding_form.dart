import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:training_diary/core/generated/translations/locale_keys.g.dart';
import 'package:training_diary/src/ui/widgets/adding_form/add_traininging_form.dart';

mixin ShowTrainingAddingForm {
  void showAddingForm({
    required Function() onSecondButtonTap,
    String? firstButtonText,
    String? secondButtonText,
    Function()? onFirstButtonTap,
    required BuildContext context,
    required TextEditingController titleController,
    required TextEditingController weekDayController,
  }) {
    AddTrainingForm(
            title: LocaleKeys.enterTrainingAndDay.tr(),
            firstButtonText: firstButtonText,
            onFirstButtonTap: onFirstButtonTap,
            titleController: titleController,
            weekDayController: weekDayController,
            secondButtonText: secondButtonText ?? '',
            onSecondButtonTap: onSecondButtonTap)
        .openDialog(context);
  }
}
