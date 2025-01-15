import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'your_awesome_gallery_method_channel.dart';

abstract class YourAwesomeGalleryPlatform extends PlatformInterface {
  /// Constructs a YourAwesomeGalleryPlatform.
  YourAwesomeGalleryPlatform() : super(token: _token);

  static final Object _token = Object();

  static YourAwesomeGalleryPlatform _instance = MethodChannelYourAwesomeGallery();

  /// The default instance of [YourAwesomeGalleryPlatform] to use.
  ///
  /// Defaults to [MethodChannelYourAwesomeGallery].
  static YourAwesomeGalleryPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [YourAwesomeGalleryPlatform] when
  /// they register themselves.
  static set instance(YourAwesomeGalleryPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
