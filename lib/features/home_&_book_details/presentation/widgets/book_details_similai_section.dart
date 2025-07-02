import 'package:bibliogo/core/utils/styles.dart';
import 'package:bibliogo/core/models/book_model/book_model.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/similair_books_list_view.dart';
import 'package:flutter/widgets.dart';

class BookDetailsSimilaiSection extends StatelessWidget {
  const BookDetailsSimilaiSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also like",
          style: Styles.style2.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        SimilairBooksListView(bookModel: bookModel),
      ],
    );
  }
}
