import 'package:bibliogo/features/views/home_view/widgets/cover_book_item.dart';
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
          return CoverBookItem();
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
