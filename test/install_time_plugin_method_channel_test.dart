import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:install_time_plugin/install_time_plugin_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelInstallTimePlugin platform = MethodChannelInstallTimePlugin();
  const MethodChannel channel = MethodChannel('install_time_plugin');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          return '42';
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getFirstInstallTime(), '42');
  });
}
