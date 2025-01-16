import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ImageViewerCubit extends Cubit<int> {
  final int startIndex;
  final List<String> images;

  ImageViewerCubit({
    required this.startIndex,
    required this.images,
  }) : super(startIndex);

  void showNextImage() {
    if (state < images.length - 1) {
      emit(state + 1);
    }
  }

  void showPreviousImage() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}
