import 'package:cheq_your_awesome_gallery/feature/images/screens/images_screen.dart';
import 'package:cheq_your_awesome_gallery/feature/shared/widgets/grid_component.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class AlbumGrid extends StatelessWidget {
  final List<Album> albums;

  const AlbumGrid({super.key, required this.albums});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: albums.length,
      itemBuilder: (context, index) {
        return GridComponent(
          imagePath: albums[index].images[0].path,
          title: albums[index].name,
          count: albums[index].images.length,
          isAlbum: true,
          onTapAction: () {
            Navigator.of(context).push(ImagesScreen.route(
              albums[index],
            ));
          },
        );
      },
    );
  }
}
