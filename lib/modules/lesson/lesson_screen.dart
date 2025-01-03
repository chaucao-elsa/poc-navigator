import 'package:flutter/material.dart';
import 'package:poc_navigator/navigation/elsa_navigator.dart';
import '../../navigation/base_screen.dart';

class LessonScreen extends BaseScreen {
  const LessonScreen({
    super.key,
    required super.screenParams,
    required this.lessonId,
  });

  final String lessonId;

  @override
  String get screenName => 'Lesson/$lessonId';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson $lessonId'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => ElsaNavigator.back(context),
        ),
      ),
      body: LessonScreenBody(lessonId: lessonId),
    );
  }
}

class LessonScreenBody extends StatefulWidget {
  final String? lessonId;

  const LessonScreenBody({
    super.key,
    required this.lessonId,
  });

  @override
  State<LessonScreenBody> createState() => _LessonScreenBodyState();
}

class _LessonScreenBodyState extends State<LessonScreenBody> {
  String _selectedOption = 'none';

  @override
  Widget build(BuildContext context) {
    if (widget.lessonId == null) {
      return const Center(
        child: Text('Lesson not found'),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lesson ${widget.lessonId} Content',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          const Text(
            'This is where the lesson content would go. In a real application, '
            'this would be fetched from a database or API based on the lesson ID.',
          ),
          const SizedBox(height: 24),
          Column(
            children: [
              RadioListTile<String>(
                title: const Text('Feedback'),
                value: 'feedback',
                groupValue: _selectedOption,
                onChanged: (value) => setState(() => _selectedOption = value!),
              ),
              RadioListTile<String>(
                title: const Text('Level Switching'),
                value: 'level_switching',
                groupValue: _selectedOption,
                onChanged: (value) => setState(() => _selectedOption = value!),
              ),
              RadioListTile<String>(
                title: const Text('None'),
                value: 'none',
                groupValue: _selectedOption,
                onChanged: (value) => setState(() => _selectedOption = value!),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
