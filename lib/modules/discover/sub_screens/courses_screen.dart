import 'package:flutter/material.dart';
import 'package:poc_navigator/navigation/base_screen.dart';
import 'package:poc_navigator/navigation/elsa_navigator.dart';

class CoursesScreen extends BaseScreen {
  const CoursesScreen({super.key, required super.screenParams});

  @override
  String get screenName => 'Courses';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => ElsaNavigator.back(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current path: ${screenParams.path}'),
            Text('From: ${screenParams.from}'),
            Text('Query params: ${screenParams.queryData}'),
          ],
        ),
      ),
    );
  }
}
