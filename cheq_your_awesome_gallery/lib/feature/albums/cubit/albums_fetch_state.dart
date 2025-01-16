import 'package:domain/core/base_failure.dart';
import 'package:domain/feature/albums/entity/album.dart';
import 'package:equatable/equatable.dart';

abstract class AlbumsFetchState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialAlbumsFetchState extends AlbumsFetchState {}

class AlbumsFetchInProgressState extends AlbumsFetchState {}

class AlbumsFetchSuccessState  extends AlbumsFetchState {
  final List<Album> albums;

  AlbumsFetchSuccessState(this.albums);
}

class AlbumsFetchFailureState extends AlbumsFetchState {
  final BaseFailure failure;

  AlbumsFetchFailureState(this.failure);
}
