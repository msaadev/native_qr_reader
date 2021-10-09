import 'package:flutter/services.dart';

class MethodManager {
  final String methodChannel;
  late final MethodChannel platform;

  MethodManager({required this.methodChannel}) {
    platform = MethodChannel(methodChannel);
  }

  Future<T?> invokeMethod<T>(
      {required String method, List<dynamic>? args}) async {
    final T? result = await platform.invokeMethod(method, args);
    if (result != null) {
    return result;
    }
  }
}
