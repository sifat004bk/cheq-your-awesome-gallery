import 'package:flutter_test/flutter_test.dart';
import 'package:your_awesome_gallery/your_awesome_gallery.dart';
import 'package:your_awesome_gallery/your_awesome_gallery_platform_interface.dart';
import 'package:your_awesome_gallery/your_awesome_gallery_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockYourAwesomeGalleryPlatform
    with MockPlatformInterfaceMixin
    implements YourAwesomeGalleryPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final YourAwesomeGalleryPlatform initialPlatform = YourAwesomeGalleryPlatform.instance;

  test('$MethodChannelYourAwesomeGallery is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelYourAwesomeGallery>());
  });

  test('getPlatformVersion', () async {
    YourAwesomeGallery yourAwesomeGalleryPlugin = YourAwesomeGallery();
    MockYourAwesomeGalleryPlatform fakePlatform = MockYourAwesomeGalleryPlatform();
    YourAwesomeGalleryPlatform.instance = fakePlatform;

    expect(await yourAwesomeGalleryPlugin.getPlatformVersion(), '42');
  });
}
