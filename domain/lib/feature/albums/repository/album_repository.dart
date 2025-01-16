import 'package:dartz/dartz.dart';
import 'package:domain/core/base_failure.dart';
import 'package:domain/feature/albums/entity/album.dart';

abstract class AlbumRepository {
  Future<Either<List<Album>, BaseFailure>>
      getAlbums();
}
