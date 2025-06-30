import 'package:bibliogo/features/home_&_book_details/presentation/widgets/cover_book_item.dart';
import 'package:flutter/material.dart';

class SimilairBooksListView extends StatelessWidget {
  const SimilairBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return CoverBookItem(
            imageUrl:
                "https://en.m.wikipedia.org/wiki/File:No_image_available.svg",
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
