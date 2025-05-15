import 'package:flutter/services.dart';

class InstallTimePlugin {
  static const MethodChannel _channel = MethodChannel('install_time_plugin');

  static Future<int?> getFirstInstallTime() async {
    try {
      final int? timestamp = await _channel.invokeMethod('getFirstInstallTime');
      return timestamp;
    } catch (e) {
      print("Error retrieving install time: $e");
      return null;
    }
  }
}
