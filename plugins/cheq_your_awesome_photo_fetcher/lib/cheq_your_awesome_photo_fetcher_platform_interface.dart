import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'cheq_your_awesome_photo_fetcher_method_channel.dart';

abstract class CheqYourAwesomePhotoFetcherPlatform extends PlatformInterface {
  /// Constructs a CheqYourAwesomePhotoFetcherPlatform.
  CheqYourAwesomePhotoFetcherPlatform() : super(token: _token);

  static final Object _token = Object();

  static CheqYourAwesomePhotoFetcherPlatform _instance = MethodChannelCheqYourAwesomePhotoFetcher();

  /// The default instance of [CheqYourAwesomePhotoFetcherPlatform] to use.
  ///
  /// Defaults to [MethodChannelCheqYourAwesomePhotoFetcher].
  static CheqYourAwesomePhotoFetcherPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CheqYourAwesomePhotoFetcherPlatform] when
  /// they register themselves.
  static set instance(CheqYourAwesomePhotoFetcherPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
