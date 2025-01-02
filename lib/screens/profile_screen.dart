import 'package:flutter/material.dart';
import 'package:poc_navigator/navigation/elsa_navigator.dart';
import 'package:poc_navigator/navigation/models/return_value.dart';
import '../navigation/base_screen.dart';

class ProfileScreen extends BaseScreen {
  const ProfileScreen({super.key, required super.screenParams});

  @override
  String get screenName => 'Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ElsaNavigator.back(
                  context,
                  ReturnValue.success(
                    origin: screenName,
                    data: {'message': 'Profile updated successfully!'},
                  ),
                );
              },
              child: const Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
