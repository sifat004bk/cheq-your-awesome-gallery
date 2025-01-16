import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

class FetchAlbumsUseCase {
  final AlbumRepository _repository;

  const FetchAlbumsUseCase(this._repository);

  Future<Either<List<Album>, BaseFailure>> call() async {
    return _repository.getAlbums();
  }
}
