import 'package:auto_route/auto_route.dart';
import 'package:training_diary/core/navigation/routes_holder.dart';

@AdaptiveAutoRouter(
  routes: RoutesHolder.allRoutes,
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
