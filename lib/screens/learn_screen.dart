import 'package:flutter/material.dart';
import 'package:poc_navigator/navigation/elsa_navigator.dart';
import '../navigation/base_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Current path: $path'),
          Text('From: $from'),
          Text('Query params: $queryData'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              completeLearningCallBack?.call();
            },
            child: const Text('Complete Learning'),
          ),
        ],
      ),
    );
  }
}
