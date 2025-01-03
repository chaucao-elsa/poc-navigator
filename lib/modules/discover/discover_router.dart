import 'package:go_router/go_router.dart';
import 'package:poc_navigator/navigation/models/screen_params.dart';

import 'discover_screen.dart';

final discoverRoute = GoRoute(
  path: '/discover',
  builder: (context, state) => DiscoverScreen(
    screenParams: ScreenParams.fromGoRouterState(state),
  ),
);
