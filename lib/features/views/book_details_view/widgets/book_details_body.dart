import 'package:bibliogo/core/utils/styles.dart';
import 'package:bibliogo/features/views/book_details_view/widgets/book_actions.dart';
import 'package:bibliogo/features/views/home_view/widgets/book_rating.dart';
import 'package:bibliogo/features/views/home_view/widgets/cover_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.17),
            child: CoverBookItem(),
          ),
          Text(
            "Harry Potter and the goblet of Fire",
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
      ),
    );
  }
}
