import 'package:flutter/material.dart';
import 'package:poc_navigator/navigation/elsa_navigator.dart';

import 'models/return_value.dart';
import 'models/screen_params.dart';

// Common functionality in a mixin
mixin BaseScreenMixin {
  ScreenParams get screenParams;
  String get screenName;

  ReturnValue get defaultReturnValue => ReturnValue.success(
        origin: screenName,
        data: {'message': 'Returned from $screenName'},
      );

  void pop(BuildContext context, [ReturnValue? returnValue]) {
    ElsaNavigator.back(context, returnValue ?? defaultReturnValue);
  }

  Future<ReturnValue?> navigateTo(
    BuildContext context,
    String path, {
    Map<String, dynamic>? queryParameters,
    NavigationCallback? callback,
  }) {
    return ElsaNavigator.goPath(
      context,
      path,
      queryParameters: queryParameters,
      callback: callback,
    );
  }
}

// Base class for StatelessWidget
abstract class BaseScreen extends StatelessWidget with BaseScreenMixin {
  const BaseScreen({super.key, required this.screenParams});

  @override
  final ScreenParams screenParams;
}

// Base class for StatefulWidget
abstract class BaseStatefulScreen extends StatefulWidget with BaseScreenMixin {
  const BaseStatefulScreen({super.key, required this.screenParams});

  @override
  final ScreenParams screenParams;
}
