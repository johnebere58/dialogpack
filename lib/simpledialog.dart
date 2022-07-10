
import 'simpledialog_platform_interface.dart';

class Simpledialog {
  Future<String?> getPlatformVersion() {
    return SimpledialogPlatform.instance.getPlatformVersion();
  }
}
