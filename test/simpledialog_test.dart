import 'package:flutter_test/flutter_test.dart';
import 'package:simpledialog/simpledialog.dart';
import 'package:simpledialog/simpledialog_platform_interface.dart';
import 'package:simpledialog/simpledialog_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSimpledialogPlatform 
    with MockPlatformInterfaceMixin
    implements SimpledialogPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SimpledialogPlatform initialPlatform = SimpledialogPlatform.instance;

  test('$MethodChannelSimpledialog is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSimpledialog>());
  });

  test('getPlatformVersion', () async {
    Simpledialog simpledialogPlugin = Simpledialog();
    MockSimpledialogPlatform fakePlatform = MockSimpledialogPlatform();
    SimpledialogPlatform.instance = fakePlatform;
  
    expect(await simpledialogPlugin.getPlatformVersion(), '42');
  });
}
