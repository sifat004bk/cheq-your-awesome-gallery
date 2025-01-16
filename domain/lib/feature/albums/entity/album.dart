import 'package:domain/feature/albums/entity/image.dart';

class Album {
  final String name;
  final List<Image> images;

  Album({
    required this.name,
    required this.images,
  });
}
