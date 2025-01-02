import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'models/return_value.dart';

typedef NavigationCallback = void Function(ReturnValue returnValue);

class ElsaNavigator {
  static Future<ReturnValue?> goPath(
    BuildContext context,
    String path, {
    Map<String, dynamic>? queryParameters,
    NavigationCallback? callback,
  }) async {
    final from = GoRouterState.of(context).uri.toString();

    try {
      final fullQueryParameters = {
        ...queryParameters ?? {},
        'from': from,
      };

      final fullPath = _buildPath(path, fullQueryParameters);

      return context.push<ReturnValue?>(
        fullPath,
      );
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return ReturnValue.error(
        errorCode: NavigationFailure.internalError,
        errorMessage: e.toString(),
        origin: from,
      );
    }
  }

  static void back(BuildContext context, [ReturnValue? returnValue]) {
    final currentUri = GoRouterState.of(context).uri;
    // get path without query parameters
    final path = currentUri.path;
    final queryParameters = {...currentUri.queryParameters};

    // extract from to get previous path for back
    final from = queryParameters.remove('from');

    final value = returnValue ??
        ReturnValue.success(
          origin: path,
        );

    // Check if we can pop the current route
    if (context.canPop()) {
      context.pop(value);
    } else if (from != null) {
      context.replace(from);
    } else {
      // If we can't pop (e.g., on web with direct URL access), go to home
      context.go('/home'); // Assuming '/' is your home route
    }
  }

  static String _buildPath(String path, Map<String, dynamic>? queryParameters) {
    if (queryParameters == null || queryParameters.isEmpty) {
      return path;
    }

    final queryString = queryParameters.entries
        .map((e) => '${e.key}=${Uri.encodeComponent(e.value.toString())}')
        .join('&');

    return '$path?$queryString';
  }
}
