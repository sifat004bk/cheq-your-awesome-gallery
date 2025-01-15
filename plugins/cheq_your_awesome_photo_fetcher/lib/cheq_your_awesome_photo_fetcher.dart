
import 'cheq_your_awesome_photo_fetcher_platform_interface.dart';

class CheqYourAwesomePhotoFetcher {
  Future<String?> getPlatformVersion() {
    return CheqYourAwesomePhotoFetcherPlatform.instance.getPlatformVersion();
  }
}
