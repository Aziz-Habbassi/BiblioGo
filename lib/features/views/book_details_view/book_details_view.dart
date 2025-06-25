import 'package:bibliogo/features/views/book_details_view/widgets/book_details_app_bar.dart';
import 'package:bibliogo/features/views/book_details_view/widgets/book_details_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: BookDetailsAppBar(), body: BookDetailsBody());
  }
}
