// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumData _$AlbumDataFromJson(Map<String, dynamic> json) => AlbumData(
      name: json['albumName'] as String,
      images: (json['photos'] as List<dynamic>)
          .map((e) => ImageData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlbumDataToJson(AlbumData instance) => <String, dynamic>{
      'albumName': instance.name,
      'photos': instance.images,
    };

ImageData _$ImageDataFromJson(Map<String, dynamic> json) => ImageData(
      id: json['id'] as String,
      name: json['name'] as String,
      path: json['path'] as String,
    );

Map<String, dynamic> _$ImageDataToJson(ImageData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
    };
