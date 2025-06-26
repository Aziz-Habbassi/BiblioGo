import 'package:bibliogo/features/home_&_book_details/presentation/widgets/book_details_section.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/book_details_similai_section.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const BookDetailsSection(),
          const SizedBox(height: 40),
          const BookDetailsSimilaiSection(),
        ],
      ),
    );
  }
}
