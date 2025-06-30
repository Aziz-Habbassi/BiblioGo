import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
          child: CachedNetworkImage(
            errorWidget: (context, url, error) =>
                Icon(Icons.error, color: Colors.deepPurpleAccent, size: 24),
            fit: BoxFit.fill,
            imageUrl: imageUrl,
            progressIndicatorBuilder: (context, url, progress) =>
                SpinKitPulse(size: 32, color: Colors.deepPurpleAccent),
          ),
        ),
      ),
    );
  }
}
