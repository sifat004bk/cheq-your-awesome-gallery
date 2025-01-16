import 'package:data/core/models.dart';

import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('AlbumRepositoryImpl Tests', () {

    test('should correctly parse ImageData and AlbumData', () {

      final jsonImage = {'id': 1, 'name': 'beach', 'path': '/images/beach.jpg'};
      final imageData = ImageData.fromJson(jsonImage);
      final imageEntity = imageData.toEntity();

      expect(imageEntity, isA<Image>());
      expect(imageEntity.id, 1);
      expect(imageEntity.name, 'beach');
      expect(imageEntity.path, '/images/beach.jpg');

      final jsonAlbum = {
        'albumName': 'Summer Vacation',
        'photos': [
          {'id': 1, 'name': 'beach', 'path': '/images/beach.jpg'},
        ]
      };
      final albumData = AlbumData.fromJson(jsonAlbum);
      final albumEntity = albumData.toEntity();

      expect(albumEntity, isA<Album>());
      expect(albumEntity.name, 'Summer Vacation');
      expect(albumEntity.images.length, 1);
      expect(albumEntity.images.first.name, 'beach');
    });
  });
}
