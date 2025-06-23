import 'package:bibliogo/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CoverBookItem extends StatelessWidget {
  const CoverBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.56 / 4,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 23, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(cover), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
