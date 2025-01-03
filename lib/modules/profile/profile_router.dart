import 'package:go_router/go_router.dart';
import 'package:poc_navigator/navigation/models/screen_params.dart';

import 'profile_screen.dart';

final profileRoute = GoRoute(
  path: '/profile',
  builder: (context, state) => ProfileScreen(
    screenParams: ScreenParams.fromGoRouterState(state),
  ),
);
