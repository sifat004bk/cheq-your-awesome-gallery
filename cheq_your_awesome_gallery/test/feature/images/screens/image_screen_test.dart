import 'package:cheq_your_awesome_gallery/feature/images/screens/images_screen.dart';
import 'package:cheq_your_awesome_gallery/feature/shared/widgets/grid_component.dart';
import 'package:domain/feature/albums/entity/album.dart';
import 'package:domain/feature/albums/entity/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAlbum extends Mock implements Album {}

class MockImage extends Mock implements img.Image {}

class MockRoute extends Mock implements Route<dynamic> {}

void main() {
  setUpAll(() {
    registerFallbackValue(MockRoute());
  });

  group('ImagesScreen Tests', () {
    late Album album;
    late List<img.Image> images;

    setUp(() {
      images = [
        img.Image(id: 1, name: 'image1', path: 'path/to/image1'),
        img.Image(id: 2, name: 'image2', path: 'path/to/image2'),
        img.Image(id: 3, name: 'image3', path: 'path/to/image3'),
      ];
      album = MockAlbum();
      when(() => album.name).thenReturn('My Album');
      when(() => album.images).thenReturn(images);
    });

    testWidgets('displays app bar with correct title', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ImagesScreen(album: album),
        ),
      );

      expect(find.text('My Album'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders image grid', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ImagesScreen(album: album),
        ),
      );

      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(GridComponent), findsNWidgets(images.length));
    });

    testWidgets('displays back button in app bar', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ImagesScreen(album: album),
        ),
      );

      expect(find.byIcon(Icons.arrow_back_ios_new), findsOneWidget);
    });

    testWidgets('back button pops screen', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ImagesScreen(album: album),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
      await tester.pumpAndSettle();

      expect(find.byType(ImagesScreen), findsNothing);
    });
  });
}
