import 'package:bibliogo/features/home_&_book_details/data/models/book_model/book_model.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/book_details_section.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/book_details_similai_section.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: BookDetailsSection(bookModel: bookModel)),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(
            child: BookDetailsSimilaiSection(bookModel: bookModel),
          ),
        ],
      ),
    );
  }
}
