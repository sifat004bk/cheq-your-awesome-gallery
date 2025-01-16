import 'package:cheq_your_awesome_gallery/feature/images/cubit/image_viewer_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ImageViewerCubit', () {
    late ImageViewerCubit cubit;
    final List<String> images = [
      'path/to/image1',
      'path/to/image2',
      'path/to/image3',
    ];

    setUp(() {
      cubit = ImageViewerCubit(startIndex: 0, images: images);
    });

    test('should have initial state as startIndex', () {
      expect(cubit.state, 0);
    });

    test('should show next image when showNextImage is called', () {
      cubit.showNextImage();
      expect(cubit.state, 1);
    });

    test('should not show next image when already at last image', () {
      cubit.showNextImage();
      cubit.showNextImage();
      cubit.showNextImage();
      expect(cubit.state, 2);
    });

    test('should show previous image when showPreviousImage is called', () {
      cubit.showNextImage();
      cubit.showPreviousImage();
      expect(cubit.state, 0);
    });

    test('should not show previous image when already at first image', () {
      cubit.showPreviousImage();
      expect(cubit.state, 0);
    });
  });
}
