// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:training_diary/src/cubit/exercises_cubit/exercises_cubit.dart'
    as _i8;
import 'package:training_diary/src/cubit/trainings_cubit/trainings_cubit.dart'
    as _i9;
import 'package:training_diary/src/data_sources/isar_db/exercise_isar.dart'
    as _i3;
import 'package:training_diary/src/data_sources/isar_db/isar_locale.dart'
    as _i6;
import 'package:training_diary/src/data_sources/isar_db/training_isar.dart'
    as _i5;
import 'package:training_diary/src/repositories/exercises/exercises_repository.dart'
    as _i4;
import 'package:training_diary/src/repositories/trainings/trainings_repository.dart'
    as _i7;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.ExercisesIsarDB>(() => _i3.ExercisesIsarDB());
  gh.lazySingleton<_i4.ExercisesRepository>(
      () => _i4.ExercisesRepositoryImpl(gh<_i3.ExercisesIsarDB>()));
  gh.lazySingleton<_i5.IsarDB>(() => _i5.IsarDB());
  gh.lazySingleton<_i6.IsarLocaleDB>(() => _i6.IsarLocaleDB());
  gh.lazySingleton<_i7.TrainingsRepository>(
      () => _i7.TrainingsRepositoryImpl(gh<_i5.IsarDB>()));
  gh.factory<_i8.ExercisesCubit>(
      () => _i8.ExercisesCubit(gh<_i4.ExercisesRepository>()));
  gh.factory<_i9.TrainingsCubit>(
      () => _i9.TrainingsCubit(gh<_i7.TrainingsRepository>()));
  return getIt;
}
