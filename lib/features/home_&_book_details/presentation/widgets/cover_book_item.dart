import 'package:flutter/material.dart';

class CoverBookItem extends StatelessWidget {
  const CoverBookItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.56 / 4,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 23, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
