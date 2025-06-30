import 'package:bibliogo/features/home_&_book_details/presentation/manager/relevance_books_cubit/relevance_books_cubit.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/cover_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoversListView extends StatelessWidget {
  const CoversListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelevanceBooksCubit, RelevanceBooksState>(
      builder: (context, state) {
        if (state is RelevanceBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .35,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CoverBookItem(
                  imageUrl:
                      state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                );
              },
            ),
          );
        } else if (state is RelevanceBooksLoading) {
          return Text("");
        } else {
          return Icon(Icons.error);
        }
      },
    );
  }
}
