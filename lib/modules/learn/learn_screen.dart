import 'package:flutter/material.dart';
import 'package:poc_navigator/navigation/elsa_navigator.dart';

import '../../navigation/base_screen.dart';

class LearnScreen extends BaseScreen {
  const LearnScreen({super.key, required super.screenParams});

  @override
  String get screenName => 'Learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => ElsaNavigator.back(context),
        ),
      ),
      body: LearnScreenBody(
        path: screenParams.path,
        from: screenParams.from,
        queryData: screenParams.queryData,
        completeLearningCallBack: () => ElsaNavigator.back(context),
      ),
    );
  }
}

class LearnScreenBody extends StatelessWidget {
  final String path;
  final String from;
  final Map<String, dynamic> queryData;
  final VoidCallback? completeLearningCallBack;

  const LearnScreenBody({
    super.key,
    required this.path,
    required this.from,
    required this.queryData,
    this.completeLearningCallBack,
  });

  // Sample lesson data - in a real app, this would come from a service or database
  final List<Map<String, dynamic>> lessons = const [
    {'id': '1', 'title': 'Introduction to Flutter'},
    {'id': '2', 'title': 'Dart Basics'},
    {'id': '3', 'title': 'Widget Fundamentals'},
    {'id': '4', 'title': 'State Management'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        final lesson = lessons[index];
        return ListTile(
          title: Text(lesson['title']),
          subtitle: Text('Lesson ${lesson['id']}'),
          onTap: () {
            ElsaNavigator.goPath(context, '/learn/lesson/${lesson['id']}');
          },
        );
      },
    );
  }
}
