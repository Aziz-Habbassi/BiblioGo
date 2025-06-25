import 'package:bibliogo/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(Icons.star, color: Colors.amber),
        Text("4.8", style: Styles.style2.copyWith(fontSize: 16)),
        Text(
          " (245)",
          style: Styles.style2.copyWith(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
