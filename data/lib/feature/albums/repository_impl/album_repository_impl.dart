import 'package:cheq_your_awesome_photo_fetcher/cheq_your_awesome_photo_fetcher.dart';
import 'package:dartz/dartz.dart';
import 'package:data/core/models.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AlbumRepository)
class AlbumRepositoryImpl implements AlbumRepository {
  AlbumRepositoryImpl();

  @override
  Future<Either<List<Album>, BaseFailure>> getAlbums() async {
    final photoFetcher = CheqYourAwesomePhotoFetcher();
    try {
      final rawAlbums = await photoFetcher.getPhotosByAlbum();

      final albums =
          rawAlbums.map((raw) => AlbumData.fromJson(raw).toEntity()).toList();

      return Left(albums);
    } catch (e) {
      return Right(BaseFailure(message: 'Album Fetch Failed'));
    }
  }
}
