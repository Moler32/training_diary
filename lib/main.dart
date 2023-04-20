import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:training_diary/application.dart';
import 'package:training_diary/core/generated/translations/codegen_loader.g.dart';
import 'package:training_diary/src/cubit/exercises_cubit/exercises_cubit.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:training_diary/src/cubit/trainings_cubit/trainings_cubit.dart';
import 'package:training_diary/src/data_sources/isar_db/isar.dart';
import 'package:training_diary/src/data_sources/isar_db/isar_locale.dart';
import 'core/di/injection.dart';

Future<void> main() async {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');
  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printStateFullData: false,
      printEventFullData: false,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  FlutterError.onError = (details) => GetIt.I<Talker>().handle(
        details.exception,
        details.stack,
      );

  runZonedGuarded(
    () => runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('uk'),
          Locale('en'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: MultiBlocProvider(
          providers: _blockProviders(),
          child: MultiProvider(
            providers: _providers(),
            child: const TrainingDiaryApp(),
          ),
        ),
      ),
    ),
    (error, stack) => GetIt.I<Talker>().handle(error, stack),
  );
}

List<Provider> _providers() {
  return [
    Provider<IsarDB>(
      create: (context) => getIt<IsarDB>(),
    ),
    Provider<IsarLocaleDB>(
      create: (context) => getIt<IsarLocaleDB>(),
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
    // BlocProvider<StopwatchCubit>(
    //   create: (context) => StopwatchCubit(getIt<IsarProvider>()),
    // ),
  ];
}
