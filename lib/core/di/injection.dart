import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:training_diary/core/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(asExtension: false)
GetIt configureDependencies() => init(getIt);
