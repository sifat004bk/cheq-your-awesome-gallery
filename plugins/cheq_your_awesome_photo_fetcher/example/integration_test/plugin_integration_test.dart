// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing


import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:cheq_your_awesome_photo_fetcher/cheq_your_awesome_photo_fetcher.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getPhotosByAlbum integration test', (WidgetTester tester) async {
    final CheqYourAwesomePhotoFetcher plugin = CheqYourAwesomePhotoFetcher();
    final  albums = await plugin.getPhotosByAlbum();
    if(albums.isNotEmpty) {
      expect(albums[0].isNotEmpty, true);
    }
  });
}
