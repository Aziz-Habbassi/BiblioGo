import 'package:bibliogo/features/home_&_book_details/presentation/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';

class CoverBookItem extends StatelessWidget {
  const CoverBookItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.56 / 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 12),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(8),
          child: CustomCachedImage(imageUrl: imageUrl),
        ),
      ),
    );
  }
}
