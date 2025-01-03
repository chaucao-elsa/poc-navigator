import 'package:go_router/go_router.dart';
import 'package:poc_navigator/navigation/models/screen_params.dart';

import 'leaderboard_screen.dart';

final leaderboardRoute = GoRoute(
  path: '/leaderboard',
  builder: (context, state) => LeaderboardScreen(
    screenParams: ScreenParams.fromGoRouterState(state),
  ),
);
