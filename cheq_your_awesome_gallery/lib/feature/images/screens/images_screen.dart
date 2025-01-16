import 'package:cheq_your_awesome_gallery/feature/images/widgets/image_grid.dart';
import 'package:cheq_your_awesome_gallery/resources/colors.dart';
import 'package:cheq_your_awesome_gallery/resources/text_styles.dart';
import 'package:domain/feature/albums/entity/album.dart';
import 'package:flutter/material.dart';

class ImagesScreen extends StatelessWidget {
  static const path = '/imagesScreen';

  final Album album;

  const ImagesScreen({super.key, required this.album});

  static Route<void> route(Album album) {
    return MaterialPageRoute<void>(
      builder: (_) => ImagesScreen(album: album),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                child: ImageGrid(images: album.images),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        album.name,
        style: AppTextStyles.appbarTextStyle,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: true,
      backgroundColor: AppColor.white,
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: const Icon(Icons.arrow_back_ios_new),
        onTap: () => Navigator.of(context).pop(),
      ),
    );
  }
}
