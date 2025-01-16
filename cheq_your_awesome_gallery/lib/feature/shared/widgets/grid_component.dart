import 'dart:io';

import 'package:cheq_your_awesome_gallery/resources/colors.dart';
import 'package:cheq_your_awesome_gallery/resources/text_styles.dart';
import 'package:flutter/material.dart';

class GridComponent extends StatelessWidget {
  final String imagePath;
  final String? title;
  final int? count;
  final bool isAlbum;
  final VoidCallback onTapAction;

  const GridComponent({
    super.key,
    required this.imagePath,
    this.title,
    this.count,
    this.isAlbum = false,
    required this.onTapAction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapAction,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(File(imagePath)),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                color: isAlbum
                    ? AppColor.black.withValues(alpha: 0.5)
                    : AppColor.imageLayerColor.withValues(alpha: 0.2),
              ),
              if (title != null && count != null)
                _buildAlbumDetails(title!, count!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlbumDetails(String title, int imageCount) {
    return Positioned(
      bottom: 12,
      left: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.albumTitleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 3),
          Text(
            '$imageCount Photos',
            style: AppTextStyles.imageCountStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
