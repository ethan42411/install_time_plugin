import 'package:flutter_test/flutter_test.dart';
import 'package:install_time_plugin/install_time_plugin.dart';
import 'package:install_time_plugin/install_time_plugin_platform_interface.dart';
import 'package:install_time_plugin/install_time_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInstallTimePluginPlatform
    with MockPlatformInterfaceMixin
    implements InstallTimePluginPlatform {
  @override
  Future<String?> getFirstInstallTime() => Future.value(null);
}

void main() {
  final InstallTimePluginPlatform initialPlatform =
      InstallTimePluginPlatform.instance;

  test('$MethodChannelInstallTimePlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInstallTimePlugin>());
  });

  test('getFirstInstallTime', () async {
    MockInstallTimePluginPlatform fakePlatform =
        MockInstallTimePluginPlatform();
    InstallTimePluginPlatform.instance = fakePlatform;

    final int? installTime = await InstallTimePlugin.getFirstInstallTime();
    // The version string depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(installTime, null);
  });
}
