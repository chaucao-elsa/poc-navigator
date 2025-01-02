import 'dart:async';

import 'package:flutter/foundation.dart';
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
      // add from to query parameters
      final fullQueryParameters = {
        ...queryParameters ?? {},
        'from': from,
      };
      final fullPath = _buildPath(path, fullQueryParameters);
      if (kIsWeb) {
        // might need to handle navigate a bit differently on web
        return context.push<ReturnValue?>(fullPath);
      } else {
        return context.push<ReturnValue?>(fullPath);
      }
    } catch (e) {
      return ReturnValue.error(
        errorCode: NavigationFailure.internalError,
        errorMessage: e.toString(),
        origin: from,
      );
    }
  }

  static void back(BuildContext context, [ReturnValue? returnValue]) {
    final value = returnValue ??
        ReturnValue.success(origin: GoRouterState.of(context).uri.toString());
    context.pop(value);
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
