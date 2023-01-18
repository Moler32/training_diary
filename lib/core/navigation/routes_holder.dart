import 'package:auto_route/auto_route.dart';

import '../../src/ui/screens/exercises/pages/exercises_page.dart';
import '../../src/ui/screens/trainings/pages/trainings_page.dart';

class RoutesHolder {
  static const List<AutoRoute> allRoutes = <AutoRoute>[
    //Home
    AutoRoute(page: TrainingsPage),

    AutoRoute(page: ExercisesPage)
  ];
}
