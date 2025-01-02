import 'package:flutter/material.dart';
import 'package:poc_navigator/navigation/elsa_navigator.dart';

import '../navigation/base_screen.dart';

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
            ElevatedButton(
              onPressed: () {
                pop(
                  context,
                  defaultReturnValue.copyWith(
                    data: {'message': 'Found something interesting!'},
                  ),
                );
              },
              child: const Text('Discover Something'),
            ),
          ],
        ),
      ),
    );
  }
}
