import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'simpledialog_method_channel.dart';

abstract class SimpledialogPlatform extends PlatformInterface {
  /// Constructs a SimpledialogPlatform.
  SimpledialogPlatform() : super(token: _token);

  static final Object _token = Object();

  static SimpledialogPlatform _instance = MethodChannelSimpledialog();

  /// The default instance of [SimpledialogPlatform] to use.
  ///
  /// Defaults to [MethodChannelSimpledialog].
  static SimpledialogPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SimpledialogPlatform] when
  /// they register themselves.
  static set instance(SimpledialogPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
