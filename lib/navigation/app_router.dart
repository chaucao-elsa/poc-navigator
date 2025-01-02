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
      GoRoute(
        path: '/home',
        builder: (context, state) => HomeScreen(
          screenParams: ScreenParams.fromGoRouterState(state),
        ),
      ),
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
