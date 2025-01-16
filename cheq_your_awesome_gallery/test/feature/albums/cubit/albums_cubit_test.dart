import 'package:dartz/dartz.dart';
import 'package:domain/feature/albums/entity/image.dart' as img;
import 'package:domain/feature/albums/use_case/fetch_albums_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:cheq_your_awesome_gallery/feature/albums/cubit/albums_cubit.dart';
import 'package:cheq_your_awesome_gallery/feature/albums/cubit/albums_fetch_state.dart';
import 'package:domain/feature/albums/entity/album.dart';
import 'package:domain/core/base_failure.dart';
import 'package:bloc_test/bloc_test.dart';

class MockFetchAlbumsUseCase extends Mock implements FetchAlbumsUseCase {}

void main() {
  late MockFetchAlbumsUseCase mockFetchAlbumsUseCase;
  late AlbumsCubit albumsCubit;
  late List<img.Image> images;

  setUp(() {
    images = [
      img.Image(id: 1, name: 'image1', path: 'path/to/image1'),
      img.Image(id: 2, name: 'image2', path: 'path/to/image2'),
      img.Image(id: 3, name: 'image3', path: 'path/to/image3'),
    ];
    mockFetchAlbumsUseCase = MockFetchAlbumsUseCase();
    albumsCubit = AlbumsCubit(mockFetchAlbumsUseCase);
  });

  tearDown(() {
    albumsCubit.close();
  });

  group('AlbumsCubit Tests', () {
    test('Initial state is correct', () {
      expect(albumsCubit.state, InitialAlbumsFetchState());
    });

    blocTest<AlbumsCubit, AlbumsFetchState>(
      'emits [AlbumsFetchInProgressState, AlbumsFetchSuccessState] when albums are fetched successfully',
      build: () {
        when(() => mockFetchAlbumsUseCase()).thenAnswer(
          (_) async => Left([
            Album(name: 'Album 1', images: images),
            Album(name: 'Album 2', images: images),
          ]),
        );
        return albumsCubit;
      },
      act: (cubit) => cubit.fetchAlbums(),
      expect: () => [
        AlbumsFetchInProgressState(),
        AlbumsFetchSuccessState([
          Album(name: 'Album 1', images: images),
          Album(name: 'Album 2', images: images),
        ]),
      ],
    );

    blocTest<AlbumsCubit, AlbumsFetchState>(
      'emits [AlbumsFetchInProgressState, AlbumsFetchFailureState] when albums fetch fails',
      build: () {
        when(() => mockFetchAlbumsUseCase()).thenAnswer(
          (_) async => Right(BaseFailure(message: 'Error fetching albums')),
        );
        return albumsCubit;
      },
      act: (cubit) => cubit.fetchAlbums(),
      expect: () => [
        AlbumsFetchInProgressState(),
        AlbumsFetchFailureState(BaseFailure(message: 'Error fetching albums')),
      ],
    );
  });
}
