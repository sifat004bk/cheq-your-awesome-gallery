import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:cheq_your_awesome_gallery/feature/images/cubit/image_viewer_cubit.dart';
import 'package:cheq_your_awesome_gallery/feature/images/screens/image_viewer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:domain/feature/albums/entity/image.dart' as img;
import 'package:mocktail/mocktail.dart';

class MockImageViewerCubit extends MockCubit<int> implements ImageViewerCubit {}

void main() {
  group('ImageViewerScreen Tests', () {
    late List<img.Image> mockImages;
    late ImageViewerCubit mockCubit;

    setUp(() {
      mockImages = [
        img.Image(id: 1, name: 'image1', path: 'path/to/image1'),
        img.Image(id: 2, name: 'image2', path: 'path/to/image2'),
        img.Image(id: 3, name: 'image3', path: 'path/to/image3'),
      ];

      mockCubit = MockImageViewerCubit();
    });

    testWidgets('should display the image at the start index',
        (WidgetTester tester) async {
      when(() => mockCubit.state).thenReturn(0);

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ImageViewerCubit>.value(
            value: mockCubit,
            child: ImageViewerScreen(
              images: mockImages,
              startIndex: 0,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(Image), findsOneWidget);

      final imageWidget = tester.widget<Image>(find.byType(Image));
      final imageFile = imageWidget.image as FileImage;
      expect(imageFile.file.path, mockImages[0].path);
    });
  });
}
