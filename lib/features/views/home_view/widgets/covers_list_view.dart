import 'package:bibliogo/features/views/home_view/widgets/cover_book_item.dart';
import 'package:flutter/material.dart';

class CoversListView extends StatelessWidget {
  const CoversListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CoverBookItem();
        },
      ),
    );
  }
}
