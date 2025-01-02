class ReturnValue {
  final dynamic data;
  final String origin;
  final bool shouldRefresh;
  final bool fromNative;
  final NavigationFailure? failure;

  ReturnValue({
    this.data,
    required this.origin,
    this.shouldRefresh = false,
    this.fromNative = false,
    this.failure,
  });

  ReturnValue copyWith({
    dynamic data,
    String? origin,
    bool? shouldRefresh,
    bool? fromNative,
    NavigationFailure? failure,
  }) {
    return ReturnValue(
      data: data ?? this.data,
      origin: origin ?? this.origin,
      shouldRefresh: shouldRefresh ?? this.shouldRefresh,
      fromNative: fromNative ?? this.fromNative,
      failure: failure ?? this.failure,
    );
  }

  factory ReturnValue.success({
    dynamic data,
    required String origin,
    bool shouldRefresh = false,
    bool fromNative = false,
  }) {
    return ReturnValue(
      data: data,
      origin: origin,
      shouldRefresh: shouldRefresh,
      fromNative: fromNative,
    );
  }

  factory ReturnValue.error({
    required int errorCode,
    required String errorMessage,
    required String origin,
  }) {
    return ReturnValue(
      origin: origin,
      failure: NavigationFailure(
        errorCode: errorCode,
        errorMessage: errorMessage,
      ),
    );
  }

  @override
  String toString() {
    return 'ReturnValue(data: $data, origin: $origin, shouldRefresh: $shouldRefresh, fromNative: $fromNative, failure: $failure)';
  }
}

class NavigationFailure {
  final int errorCode;
  final String errorMessage;

  const NavigationFailure({
    required this.errorCode,
    required this.errorMessage,
  });

  static const unauthorized = 401;
  static const forbidden = 403;
  static const notFound = 404;
  static const gone = 410;
  static const featureDisabled = 413;
  static const internalError = 500;
}
