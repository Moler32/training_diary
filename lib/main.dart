import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_diary/application.dart';
import 'package:training_diary/generated/codegen_loader.g.dart';
import 'package:training_diary/src/cubit/exercises_cubit/exercises_cubit.dart';
import 'package:training_diary/src/cubit/trainings_cubit/trainings_cubit.dart';
import 'package:training_diary/src/data_sources/provider/isar_provider.dart';

import 'core/di/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ru'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ru'),
      assetLoader: const CodegenLoader(),
      child: MultiBlocProvider(
        providers: _blockProviders(),
        child: MultiProvider(
          providers: _providers(),
          child: const TrainingDiaryApp(),
        ),
      ),
    ),
  );
}

List<Provider> _providers() {
  return [
    Provider<IsarProvider>(
      create: (context) => getIt<IsarProvider>(),
    ),
  ];
}

List<BlocProvider> _blockProviders() {
  return [
    BlocProvider<ExercisesCubit>(
      create: (context) => getIt<ExercisesCubit>(),
    ),
    BlocProvider<TrainingsCubit>(
      create: (context) => getIt<TrainingsCubit>(),
    ),
  ];
}
