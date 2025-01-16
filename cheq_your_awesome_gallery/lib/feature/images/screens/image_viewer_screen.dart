import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/feature/albums/entity/image.dart' as img;
import 'package:cheq_your_awesome_gallery/resources/colors.dart';

import '../cubit/image_viewer_cubit.dart';

class ImageViewerScreen extends StatefulWidget {
  final List<img.Image> images;
  final int startIndex;

  static Route<void> route(List<img.Image> images, int index) {
    return MaterialPageRoute<void>(
      builder: (_) => ImageViewerScreen(
        images: images,
        startIndex: index,
      ),
    );
  }

  const ImageViewerScreen({
    super.key,
    required this.images,
    required this.startIndex,
  });

  @override
  State<ImageViewerScreen> createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  late ImageViewerCubit _imageViewerCubit;

  @override
  void initState() {
    super.initState();

    _imageViewerCubit = ImageViewerCubit(
      images: widget.images.map((image) => image.path).toList(),
      startIndex: widget.startIndex,
    );
  }

  @override
  void dispose() {
    _imageViewerCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.black,
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.white,
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: AppColor.black,
      body: Padding(
        padding: EdgeInsets.only(bottom: appBarHeight),
        child: BlocBuilder<ImageViewerCubit, int>(
          bloc: _imageViewerCubit,
          builder: (context, currentIndex) {
            final currentImagePath = widget.images[currentIndex].path;

            return Center(
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! < 0) {
                    _imageViewerCubit.showNextImage();
                  } else if (details.primaryVelocity! > 0) {
                    _imageViewerCubit.showPreviousImage();
                  }
                },
                child: Image.file(
                  File(currentImagePath),
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
