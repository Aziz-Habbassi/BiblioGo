import 'package:bibliogo/core/utils/assets.dart';
import 'package:bibliogo/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(cover, height: 200),
        SizedBox(width: 30),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  "Harry Potter and the goblet of Fire ",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.style1,
                ),
              ),
              Text(
                "J.k Rowing",
                style: Styles.style2.copyWith(color: Colors.grey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    r"99 $",
                    style: Styles.style2.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  BestSellerRating(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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
