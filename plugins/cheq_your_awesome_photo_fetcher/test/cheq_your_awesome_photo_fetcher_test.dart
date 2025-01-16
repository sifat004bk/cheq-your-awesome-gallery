import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:cheq_your_awesome_photo_fetcher/cheq_your_awesome_photo_fetcher.dart';

class MockMethodChannel extends Mock implements MethodChannel {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CheqYourAwesomePhotoFetcher', () {
    late MockMethodChannel mockChannel;

    setUp(() {
      mockChannel = MockMethodChannel();
      CheqYourAwesomePhotoFetcher.channel = mockChannel;
    });

    test('should return list of albums when method call is successful',
        () async {
      final mockAlbumsResponse = [
        {
          'albumName': 'Vacation',
          'photos': [
            {
              'id': 1,
              'name': 'photo1.jpg',
              'path': '/photos/vacation/photo1.jpg'
            },
            {
              'id': 2,
              'name': 'photo2.jpg',
              'path': '/photos/vacation/photo2.jpg'
            }
          ]
        },
        {
          'albumName': 'Work',
          'photos': [
            {'id': 3, 'name': 'photo3.jpg', 'path': '/photos/work/photo3.jpg'}
          ]
        }
      ];

      when(() => mockChannel.invokeMethod('getPhotosByAlbum'))
          .thenAnswer((_) async => mockAlbumsResponse);

      final albums = await CheqYourAwesomePhotoFetcher().getPhotosByAlbum();

      expect(albums.length, 2);
      expect(albums[0]['albumName'], 'Vacation');
      expect(albums[1]['albumName'], 'Work');
      expect(albums[0]['photos'].length, 2);
      expect(albums[1]['photos'].length, 1);
    });

    test('should throw an error when method call fails', () async {
      when(() => mockChannel.invokeMethod('getPhotosByAlbum')).thenThrow(
          PlatformException(code: 'ERROR', message: 'Failed to fetch photos'));

      expect(
          () async => await CheqYourAwesomePhotoFetcher().getPhotosByAlbum(),
          throwsA(isA<String>().having(
              (e) => e, 'message', contains('Failed to fetch photos'))));
    });
  });
}
