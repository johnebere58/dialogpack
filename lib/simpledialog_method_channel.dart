import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'simpledialog_platform_interface.dart';

/// An implementation of [SimpledialogPlatform] that uses method channels.
class MethodChannelSimpledialog extends SimpledialogPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('simpledialog');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
