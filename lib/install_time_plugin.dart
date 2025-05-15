
import 'install_time_plugin_platform_interface.dart';

class InstallTimePlugin {
  Future<String?> getPlatformVersion() {
    return InstallTimePluginPlatform.instance.getPlatformVersion();
  }
}
