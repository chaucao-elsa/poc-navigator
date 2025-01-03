import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_navigator/modules/home/home_router.dart';
import 'package:poc_navigator/navigation/models/screen_params.dart';

import '../modules/discover/discover_router.dart';
import '../modules/home/home_screen.dart';
import '../modules/leaderboard/leaderboard_router.dart';
import '../modules/learn/learn_router.dart';
import '../modules/profile/profile_router.dart';

class AppRouter {
  static final _router = GoRouter(
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
                StatefulNavigationShell navigationShell) =>
            HomeScreen(
          screenParams: ScreenParams.fromGoRouterState(state),
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              homeRoute,
            ],
          ),
          StatefulShellBranch(
            routes: [
              homeLearnRoute,
            ],
          ),
        ],
      ),
      learnRoute,
      discoverRoute,
      leaderboardRoute,
      profileRoute,
    ],
  );

  static GoRouter get router => _router;
}
