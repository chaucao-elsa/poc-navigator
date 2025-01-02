import 'package:flutter/material.dart';
import 'package:poc_navigator/navigation/elsa_navigator.dart';
import 'package:poc_navigator/navigation/models/return_value.dart';
import '../navigation/base_screen.dart';

class LeaderboardScreen extends BaseStatefulScreen {
  const LeaderboardScreen({super.key, required super.screenParams});

  @override
  String get screenName => 'Leaderboard';

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  late final screenParams = widget.screenParams;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => ElsaNavigator.back(
            context,
            ReturnValue.success(
              origin: widget.screenName,
              data: {'counter': _counter},
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current path: ${screenParams.path}'),
            Text('From: ${screenParams.from}'),
            Text('Query params: ${screenParams.queryData}'),
            const SizedBox(height: 20),
            Text(
              'Counter: $_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _counter--),
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => setState(() => _counter++),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
