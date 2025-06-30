import 'package:bibliogo/core/utils/styles.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/book_actions.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/book_rating.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/cover_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.17),
          child: CoverBookItem(
            imageUrl:
                "https://en.m.wikipedia.org/wiki/File:No_image_available.svg",
          ),
        ),
        Text(
          "Alex Schreiber Wildernes of the Eternal Oceans",
          style: Styles.style1.copyWith(fontSize: 23),
          textAlign: TextAlign.center,
        ),
        Text(
          "J.k Rowing",
          style: Styles.style2.copyWith(color: Colors.grey, fontSize: 18),
        ),
        const SizedBox(height: 20),
        BookRating(mainAxisAlignment: MainAxisAlignment.center),
        const SizedBox(height: 20),
        BookActions(),
      ],
    );
  }
}
