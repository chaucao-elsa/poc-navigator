import 'package:go_router/go_router.dart';
import 'package:poc_navigator/modules/lesson/lesson_screen.dart';
import 'package:poc_navigator/navigation/models/screen_params.dart';

final lessonRoute = GoRoute(
  path: '/lesson/:lessonId',
  builder: (context, state) => LessonScreen(
    screenParams: ScreenParams.fromGoRouterState(state),
    lessonId: state.pathParameters['lessonId'] ?? '',
  ),
);
