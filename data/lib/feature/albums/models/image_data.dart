part of '../../../core/models.dart';

@JsonSerializable()
class ImageData {
  final String id;
  final String name;
  final String path;

  ImageData({
    required this.id,
    required this.name,
    required this.path,
  });

  factory ImageData.fromJson(Map<String,dynamic> json) =>
      _$ImageDataFromJson(json);

  Image toEntity() {
    return Image(id: id, name: name, path: path);
  }
}
