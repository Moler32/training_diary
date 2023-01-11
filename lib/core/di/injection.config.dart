// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:training_diary/src/cubit/exercises_cubit/exercises_cubit.dart'
    as _i5;
import 'package:training_diary/src/cubit/trainings_cubit/trainings_cubit.dart'
    as _i4;
import 'package:training_diary/src/data_sources/provider/isar_provider.dart'
    as _i3;

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
  gh.lazySingleton<_i3.IsarProvider>(() => _i3.IsarProvider());
  gh.factory<_i4.TrainingsCubit>(
      () => _i4.TrainingsCubit(gh<_i3.IsarProvider>()));
  gh.factory<_i5.ExercisesCubit>(
      () => _i5.ExercisesCubit(gh<_i3.IsarProvider>()));
  return getIt;
}
