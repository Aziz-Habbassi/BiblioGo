import 'package:bibliogo/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.avgRating,
    this.ratingCount,
  });
  final num? avgRating;
  final num? ratingCount;

  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    if (avgRating == null || ratingCount == null) {
      return Row();
    } else {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Icon(Icons.star, color: Colors.amber),
          Text(
            avgRating.toString(),
            style: Styles.style2.copyWith(fontSize: 16),
          ),
          Text(
            " $ratingCount",
            style: Styles.style2.copyWith(fontSize: 16, color: Colors.grey),
          ),
        ],
      );
    }
  }
}
