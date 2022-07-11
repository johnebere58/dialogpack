import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'dialogpack_method_channel.dart';

abstract class DialogpackPlatform extends PlatformInterface {
  /// Constructs a DialogpackPlatform.
  DialogpackPlatform() : super(token: _token);

  static final Object _token = Object();

  static DialogpackPlatform _instance = MethodChannelDialogpack();

  /// The default instance of [DialogpackPlatform] to use.
  ///
  /// Defaults to [MethodChannelDialogpack].
  static DialogpackPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DialogpackPlatform] when
  /// they register themselves.
  static set instance(DialogpackPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
