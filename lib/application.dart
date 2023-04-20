import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:training_diary/core/navigation/main_router.dart';
import 'package:training_diary/core/navigation/router.gr.dart';
import 'package:training_diary/core/styles/theme/theme.dart';

class TrainingDiaryApp extends StatelessWidget {
  const TrainingDiaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Training Diary',
      theme: darkTheme(),
      routerDelegate: AutoRouterDelegate(
        navigatorObservers: () => [
          TalkerRouteObserver(GetIt.I<Talker>()),
        ],
        MainRouter().appRouter,
        initialRoutes: [
          _buildHome(),
        ],
      ),
      routeInformationParser: MainRouter().appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }

  PageRouteInfo _buildHome() {
    return const TrainingsRoute();
  }
}
