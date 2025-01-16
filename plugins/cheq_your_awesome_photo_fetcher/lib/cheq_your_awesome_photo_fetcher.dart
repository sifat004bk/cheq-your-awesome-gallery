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
        Map<String, dynamic> castedData = album.cast<String, dynamic>();
        castedAlbums.add(castedData);
      }
      return castedAlbums;
    } on PlatformException catch (e) {
      throw 'Failed to fetch photos by album: ${e.message}';
    }
  }
}
