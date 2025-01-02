import 'package:go_router/go_router.dart';

class ScreenParams {
  final String path;
  final Map<String, dynamic> queryData;
  final String from;
  final String language;
  final dynamic currentUser;

  const ScreenParams({
    required this.path,
    this.queryData = const {},
    required this.from,
    required this.language,
    this.currentUser,
  });

  factory ScreenParams.fromGoRouterState(GoRouterState state) {
    final queryData = {...state.uri.queryParameters};
    final from = queryData.remove('from');
    return ScreenParams(
      path: state.uri.path,
      queryData: queryData,
      from: from ?? '',
      language: 'en-US',
      currentUser: null,
    );
  }
}
