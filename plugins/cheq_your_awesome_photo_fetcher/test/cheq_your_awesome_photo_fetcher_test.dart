import 'package:flutter_test/flutter_test.dart';
import 'package:cheq_your_awesome_photo_fetcher/cheq_your_awesome_photo_fetcher.dart';
import 'package:cheq_your_awesome_photo_fetcher/cheq_your_awesome_photo_fetcher_platform_interface.dart';
import 'package:cheq_your_awesome_photo_fetcher/cheq_your_awesome_photo_fetcher_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCheqYourAwesomePhotoFetcherPlatform
    with MockPlatformInterfaceMixin
    implements CheqYourAwesomePhotoFetcherPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CheqYourAwesomePhotoFetcherPlatform initialPlatform = CheqYourAwesomePhotoFetcherPlatform.instance;

  test('$MethodChannelCheqYourAwesomePhotoFetcher is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCheqYourAwesomePhotoFetcher>());
  });

  test('getPlatformVersion', () async {
    CheqYourAwesomePhotoFetcher cheqYourAwesomePhotoFetcherPlugin = CheqYourAwesomePhotoFetcher();
    MockCheqYourAwesomePhotoFetcherPlatform fakePlatform = MockCheqYourAwesomePhotoFetcherPlatform();
    CheqYourAwesomePhotoFetcherPlatform.instance = fakePlatform;

    expect(await cheqYourAwesomePhotoFetcherPlugin.getPlatformVersion(), '42');
  });
}
