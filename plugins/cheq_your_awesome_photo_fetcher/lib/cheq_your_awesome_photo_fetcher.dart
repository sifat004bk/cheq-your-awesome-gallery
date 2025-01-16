import 'dart:async';
import 'package:flutter/services.dart';

class CheqYourAwesomePhotoFetcher {
  static MethodChannel channel = MethodChannel('cheqYourAwesomePhotoFetcher');

  Future<List<Map<String, dynamic>>> getPhotosByAlbum() async {
    try {
      final List<dynamic> albums =
          await channel.invokeMethod('getPhotosByAlbum');

      final List<Map<String, dynamic>> castedAlbums = [];

      for (dynamic album in albums) {
        Map<String, dynamic> castedAlum = album.cast<String, dynamic>();
        final rawPhotos = castedAlum['photos'];
        final List<Map<String, dynamic>> castedPhotos = [];

        for(dynamic photo in rawPhotos){
          Map<String, dynamic> castedPhoto = photo.cast<String, dynamic>();
          castedPhotos.add(castedPhoto);
        }

        castedAlbums.add({
          'albumName' : castedAlum['albumName'],
          'photos' : castedPhotos
        });
      }
      return castedAlbums;
    } on PlatformException catch (e) {
      throw 'Failed to fetch photos by album: ${e.message}';
    }
  }
}
