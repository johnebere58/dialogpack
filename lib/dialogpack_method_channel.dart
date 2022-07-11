import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dialogpack_platform_interface.dart';

/// An implementation of [DialogpackPlatform] that uses method channels.
class MethodChannelDialogpack extends DialogpackPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('dialogpack');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
