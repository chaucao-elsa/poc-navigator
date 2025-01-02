import 'package:flutter/material.dart';

import 'models/screen_params.dart';

// Force screen to have screenParams and screenName
mixin BaseScreenMixin {
  ScreenParams get screenParams;
  String get screenName;
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
