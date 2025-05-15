import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'install_time_plugin_method_channel.dart';

abstract class InstallTimePluginPlatform extends PlatformInterface {
  /// Constructs a InstallTimePluginPlatform.
  InstallTimePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static InstallTimePluginPlatform _instance = MethodChannelInstallTimePlugin();

  /// The default instance of [InstallTimePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelInstallTimePlugin].
  static InstallTimePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InstallTimePluginPlatform] when
  /// they register themselves.
  static set instance(InstallTimePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
