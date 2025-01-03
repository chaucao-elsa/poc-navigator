import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_navigator/navigation/models/screen_params.dart';

import 'bloc/counter_bloc.dart';
import 'discover_screen.dart';
import 'sub_screens/courses_screen.dart';
import 'sub_screens/role_play_screen.dart';
import 'sub_screens/topics_screen.dart';

final discoverRoute = ShellRoute(
  builder: (context, state, child) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: child,
    );
  },
  routes: [
    GoRoute(
      path: '/discover',
      builder: (context, state) => DiscoverScreen(
        screenParams: ScreenParams.fromGoRouterState(state),
      ),
      routes: [
        GoRoute(
          path: 'role-play',
          builder: (context, state) => RolePlayScreen(
            screenParams: ScreenParams.fromGoRouterState(state),
          ),
        ),
        GoRoute(
          path: 'courses',
          builder: (context, state) => CoursesScreen(
            screenParams: ScreenParams.fromGoRouterState(state),
          ),
        ),
        GoRoute(
          path: 'topics',
          builder: (context, state) => TopicsScreen(
            screenParams: ScreenParams.fromGoRouterState(state),
          ),
        ),
      ],
    ),
  ],
);
