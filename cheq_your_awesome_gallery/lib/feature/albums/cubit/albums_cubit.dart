import 'package:bloc/bloc.dart';
import 'package:cheq_your_awesome_gallery/feature/albums/cubit/albums_fetch_state.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';


@injectable
class AlbumsCubit extends Cubit<AlbumsFetchState> {
  final FetchAlbumsUseCase useCase;

  AlbumsCubit(this.useCase) : super(InitialAlbumsFetchState());

  Future<void> fetchAlbums() async {
    if (isClosed) return;
    emit(AlbumsFetchInProgressState());
    final result = await useCase();
    if (isClosed) return;
    result.fold(
      (albums) => emit(
        AlbumsFetchSuccessState(albums),
      ),
      (error) => emit(AlbumsFetchFailureState(error)),
    );
  }
}
