import 'package:go_router/go_router.dart';
import 'package:poc_navigator/modules/home/home_screen.dart';

final homeRoute = GoRoute(
  path: '/home',
  builder: (context, state) => const HomeScreenBody(),
);
