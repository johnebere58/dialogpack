import 'package:flutter_test/flutter_test.dart';
import 'package:dialogpack/dialogpack.dart';
import 'package:dialogpack/dialogpack_platform_interface.dart';
import 'package:dialogpack/dialogpack_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDialogpackPlatform
    with MockPlatformInterfaceMixin
    implements DialogpackPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DialogpackPlatform initialPlatform = DialogpackPlatform.instance;

  test('$MethodChannelDialogpack is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDialogpack>());
  });


}
