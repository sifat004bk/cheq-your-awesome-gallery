import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cheq_your_awesome_photo_fetcher_platform_interface.dart';

/// An implementation of [CheqYourAwesomePhotoFetcherPlatform] that uses method channels.
class MethodChannelCheqYourAwesomePhotoFetcher extends CheqYourAwesomePhotoFetcherPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('cheq_your_awesome_photo_fetcher');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
