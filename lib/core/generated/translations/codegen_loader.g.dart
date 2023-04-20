// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> uk = {
  "trainingDiary": "Щоденник тренувань",
  "settings": "Налаштування",
  "change": "Змінити",
  "delete": "Видалити",
  "enterTrainingAndDay": "Введіть назву тренування та день",
  "name": "Назва",
  "day": "День тижня",
  "add": "Додати",
  "clear": "Очистити",
  "resetStatus": "Скинути статус",
  "enterExercise": "Введіть назву вправи",
  "weight": "Вага",
  "time": "Час",
  "sets": "Підходи",
  "reps": "Повторення",
  "description": "Опис",
  "chooseLanguage": "Виберіть мову",
  "addTraining": "Додати тренування",
  "addExercise": "Додати вправу"
};
static const Map<String,dynamic> en = {
  "trainingDiary": "Training Diary",
  "settings": "Settings",
  "change": "Change",
  "delete": "Delete",
  "enterTrainingAndDay": "Enter the name of the workout and the day",
  "name": "Name",
  "day": "Weekday",
  "add": "Add",
  "clear": "Clear",
  "resetStatus": "Reset status",
  "enterExercise": "Enter the name of the exercise",
  "weight": "Weight",
  "time": "Time",
  "sets": "Sets",
  "reps": "Reps",
  "description": "Description",
  "chooseLanguage": "Choose language",
  "addTraining": "Add workout",
  "addExercise": "Add exercise"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"uk": uk, "en": en};
}
