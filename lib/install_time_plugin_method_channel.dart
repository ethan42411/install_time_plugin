import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'install_time_plugin_platform_interface.dart';

/// An implementation of [InstallTimePluginPlatform] that uses method channels.
class MethodChannelInstallTimePlugin extends InstallTimePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('install_time_plugin');

  @override
  Future<String?> getFirstInstallTime() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
