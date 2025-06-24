import 'package:bibliogo/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BestSellerRating extends StatelessWidget {
  const BestSellerRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
