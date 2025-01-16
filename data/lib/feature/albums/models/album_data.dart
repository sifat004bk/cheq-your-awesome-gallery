part of '../../../core/models.dart';

@JsonSerializable()
class AlbumData {
  @JsonKey(name: 'albumName')
  final String name;
  @JsonKey(name: 'photos')
  final List<ImageData> images;

  AlbumData({
    required this.name,
    required this.images,
  });

  factory AlbumData.fromJson(Map<String, dynamic> json) =>
      _$AlbumDataFromJson(json);

  Album toEntity() {
    return Album(
      name: name,
      images: images.map((image) => image.toEntity()).toList(),
    );
  }
}
