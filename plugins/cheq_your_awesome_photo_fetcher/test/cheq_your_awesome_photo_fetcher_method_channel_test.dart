import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cheq_your_awesome_photo_fetcher/cheq_your_awesome_photo_fetcher_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelCheqYourAwesomePhotoFetcher platform =
      MethodChannelCheqYourAwesomePhotoFetcher();
  const MethodChannel channel =
      MethodChannel('cheq_your_awesome_photo_fetcher');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
