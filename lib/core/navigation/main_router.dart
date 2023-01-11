import 'package:auto_route/auto_route.dart';
import 'package:training_diary/core/navigation/router.gr.dart';

class MainRouter {
  factory MainRouter() => _instance;

  MainRouter._();

  static final MainRouter _instance = MainRouter._();

  AppRouter appRouter = AppRouter();

  Future<T?> push<T extends Object?>(PageRouteInfo route) =>
      appRouter.push<T>(route);

  Future<bool> pop<T extends Object?>([T? result]) => appRouter.pop<T>(result);
}
