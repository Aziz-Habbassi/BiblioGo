import 'package:bibliogo/features/home_&_book_details/data/models/book_model/book_model.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/book_details_app_bar.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/book_details_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookDetailsAppBar(),
      body: BookDetailsBody(bookModel: bookModel),
    );
  }
}
