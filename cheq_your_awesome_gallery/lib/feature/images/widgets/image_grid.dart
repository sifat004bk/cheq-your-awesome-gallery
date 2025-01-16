import 'package:cheq_your_awesome_gallery/feature/shared/widgets/grid_component.dart';
import 'package:domain/feature/albums/entity/image.dart' as img;
import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {
  final List<img.Image> images;
  const ImageGrid({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GridComponent(
         imagePath: images[index].path,
          onTapAction: (){},
        );
      },
    );
  }
}
