import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'your_awesome_gallery_platform_interface.dart';

/// An implementation of [YourAwesomeGalleryPlatform] that uses method channels.
class MethodChannelYourAwesomeGallery extends YourAwesomeGalleryPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('your_awesome_gallery');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
