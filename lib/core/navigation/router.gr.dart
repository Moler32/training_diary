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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/cupertino.dart' as _i6;
import 'package:flutter/material.dart' as _i5;
import 'package:training_diary/src/cubit/stopwatch_cubit/stopwatch_cubit.dart'
    as _i8;
import 'package:training_diary/src/models/trainings/training_model.dart' as _i7;
import 'package:training_diary/src/ui/screens/exercises/pages/exercises_page.dart'
    as _i2;
import 'package:training_diary/src/ui/screens/profile/pages/profile_page.dart'
    as _i3;
import 'package:training_diary/src/ui/screens/trainings/pages/trainings_page.dart'
    as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    TrainingsRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.TrainingsPage(),
      );
    },
    ExercisesRoute.name: (routeData) {
      final args = routeData.argsAs<ExercisesRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.ExercisesPage(
          key: args.key,
          title: args.title,
          index: args.index,
          training: args.training,
          stopwatchCubit: args.stopwatchCubit,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.ProfilePage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          TrainingsRoute.name,
          path: '/trainings-page',
        ),
        _i4.RouteConfig(
          ExercisesRoute.name,
          path: '/exercises-page',
        ),
        _i4.RouteConfig(
          ProfileRoute.name,
          path: '/profile-page',
        ),
      ];
}

/// generated route for
/// [_i1.TrainingsPage]
class TrainingsRoute extends _i4.PageRouteInfo<void> {
  const TrainingsRoute()
      : super(
          TrainingsRoute.name,
          path: '/trainings-page',
        );

  static const String name = 'TrainingsRoute';
}

/// generated route for
/// [_i2.ExercisesPage]
class ExercisesRoute extends _i4.PageRouteInfo<ExercisesRouteArgs> {
  ExercisesRoute({
    _i6.Key? key,
    String? title,
    required int index,
    required _i7.Training training,
    required _i8.StopwatchCubit stopwatchCubit,
  }) : super(
          ExercisesRoute.name,
          path: '/exercises-page',
          args: ExercisesRouteArgs(
            key: key,
            title: title,
            index: index,
            training: training,
            stopwatchCubit: stopwatchCubit,
          ),
        );

  static const String name = 'ExercisesRoute';
}

class ExercisesRouteArgs {
  const ExercisesRouteArgs({
    this.key,
    this.title,
    required this.index,
    required this.training,
    required this.stopwatchCubit,
  });

  final _i6.Key? key;

  final String? title;

  final int index;

  final _i7.Training training;

  final _i8.StopwatchCubit stopwatchCubit;

  @override
  String toString() {
    return 'ExercisesRouteArgs{key: $key, title: $title, index: $index, training: $training, stopwatchCubit: $stopwatchCubit}';
  }
}

/// generated route for
/// [_i3.ProfilePage]
class ProfileRoute extends _i4.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile-page',
        );

  static const String name = 'ProfileRoute';
}
