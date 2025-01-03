import 'package:go_router/go_router.dart';
import 'package:poc_navigator/modules/lesson/lesson_router.dart';
import 'package:poc_navigator/navigation/models/screen_params.dart';

import 'learn_screen.dart';

final learnRoute = GoRoute(
  path: '/learn',
  builder: (context, state) => LearnScreen(
    screenParams: ScreenParams.fromGoRouterState(state),
  ),
  routes: [
    lessonRoute,
  ],
);

// used for home tab
final homeLearnRoute = GoRoute(
  path: '/home/learn',
  builder: (context, state) => LearnScreen(
    screenParams: ScreenParams.fromGoRouterState(state),
  ),
  routes: const [],
);
