import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_navigator/modules/discover/bloc/counter_bloc.dart';
import 'package:poc_navigator/navigation/base_screen.dart';
import 'package:poc_navigator/navigation/elsa_navigator.dart';

class TopicsScreen extends BaseScreen {
  const TopicsScreen({super.key, required super.screenParams});

  @override
  String get screenName => 'Topics';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topics'),
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
          ],
        ),
      ),
    );
  }
}
