import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_navigator/navigation/elsa_navigator.dart';

import '../../navigation/base_screen.dart';
import 'bloc/counter_bloc.dart';

class DiscoverScreen extends BaseScreen {
  const DiscoverScreen({super.key, required super.screenParams});

  @override
  String get screenName => 'Discover';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ElsaNavigator.back(context);
          },
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
            // Counter display and controls
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(
                      'Counter: ${state.count}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => context
                              .read<CounterBloc>()
                              .add(DecrementCounter()),
                          child: const Text('-'),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () => context
                              .read<CounterBloc>()
                              .add(IncrementCounter()),
                          child: const Text('+'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            // Navigation buttons
            ElevatedButton(
              onPressed: () =>
                  ElsaNavigator.goPath(context, '/discover/role-play'),
              child: const Text('Go to Role Play'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () =>
                  ElsaNavigator.goPath(context, '/discover/courses'),
              child: const Text('Go to Courses'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () =>
                  ElsaNavigator.goPath(context, '/discover/topics'),
              child: const Text('Go to Topics'),
            ),
          ],
        ),
      ),
    );
  }
}
