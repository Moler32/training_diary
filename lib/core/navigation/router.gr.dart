// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:flutter/material.dart' as _i4;
import 'package:training_diary/src/ui/screens/exercises/pages/exercises_page.dart'
    as _i2;
import 'package:training_diary/src/ui/screens/trainings/pages/trainings_page.dart'
    as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    TrainingsRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.TrainingsPage(),
      );
    },
    ExercisesRoute.name: (routeData) {
      final args = routeData.argsAs<ExercisesRouteArgs>();
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.ExercisesPage(
          key: args.key,
          title: args.title,
          index: args.index,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          TrainingsRoute.name,
          path: '/trainings-page',
        ),
        _i3.RouteConfig(
          ExercisesRoute.name,
          path: '/exercises-page',
        ),
      ];
}

/// generated route for
/// [_i1.TrainingsPage]
class TrainingsRoute extends _i3.PageRouteInfo<void> {
  const TrainingsRoute()
      : super(
          TrainingsRoute.name,
          path: '/trainings-page',
        );

  static const String name = 'TrainingsRoute';
}

/// generated route for
/// [_i2.ExercisesPage]
class ExercisesRoute extends _i3.PageRouteInfo<ExercisesRouteArgs> {
  ExercisesRoute({
    _i5.Key? key,
    String? title,
    required int index,
  }) : super(
          ExercisesRoute.name,
          path: '/exercises-page',
          args: ExercisesRouteArgs(
            key: key,
            title: title,
            index: index,
          ),
        );

  static const String name = 'ExercisesRoute';
}

class ExercisesRouteArgs {
  const ExercisesRouteArgs({
    this.key,
    this.title,
    required this.index,
  });

  final _i5.Key? key;

  final String? title;

  final int index;

  @override
  String toString() {
    return 'ExercisesRouteArgs{key: $key, title: $title, index: $index}';
  }
}
