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
    ExersicesRoute.name: (routeData) {
      final args = routeData.argsAs<ExersicesRouteArgs>();
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.ExersicesPage(
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
          ExersicesRoute.name,
          path: '/exersices-page',
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
/// [_i2.ExersicesPage]
class ExersicesRoute extends _i3.PageRouteInfo<ExersicesRouteArgs> {
  ExersicesRoute({
    _i5.Key? key,
    String? title,
    required int index,
  }) : super(
          ExersicesRoute.name,
          path: '/exersices-page',
          args: ExersicesRouteArgs(
            key: key,
            title: title,
            index: index,
          ),
        );

  static const String name = 'ExersicesRoute';
}

class ExersicesRouteArgs {
  const ExersicesRouteArgs({
    this.key,
    this.title,
    required this.index,
  });

  final _i5.Key? key;

  final String? title;

  final int index;

  @override
  String toString() {
    return 'ExersicesRouteArgs{key: $key, title: $title, index: $index}';
  }
}
