import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_navigator/navigation/models/screen_params.dart';

import '../screens/discover_screen.dart';
import '../screens/home_screen.dart';
import '../screens/leaderboard_screen.dart';
import '../screens/learn_screen.dart';
import '../screens/profile_screen.dart';

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
                GoRoute(
                  path: '/home',
                  builder: (context, state) => const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Home Tab Content'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/home/learn',
                  builder: (context, state) => LearnScreenBody(
                    path: state.uri.path,
                    from: state.uri.queryParameters['from'] ?? '',
                    queryData: state.uri.queryParameters,
                    completeLearningCallBack: () => context.go('/home'),
                  ),
                ),
              ],
            ),
          ]),
      GoRoute(
        path: '/learn',
        builder: (context, state) => LearnScreen(
          screenParams: ScreenParams.fromGoRouterState(state),
        ),
      ),
      GoRoute(
        path: '/discover',
        builder: (context, state) => DiscoverScreen(
          screenParams: ScreenParams.fromGoRouterState(state),
        ),
      ),
      GoRoute(
        path: '/leaderboard',
        builder: (context, state) => LeaderboardScreen(
          screenParams: ScreenParams.fromGoRouterState(state),
        ),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => ProfileScreen(
          screenParams: ScreenParams.fromGoRouterState(state),
        ),
      ),
    ],
  );

  static GoRouter get router => _router;
}
