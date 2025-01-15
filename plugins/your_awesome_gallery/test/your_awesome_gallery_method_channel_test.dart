import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_awesome_gallery/your_awesome_gallery_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelYourAwesomeGallery platform = MethodChannelYourAwesomeGallery();
  const MethodChannel channel = MethodChannel('your_awesome_gallery');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
