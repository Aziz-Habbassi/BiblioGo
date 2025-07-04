import 'package:bibliogo/features/home_&_book_details/presentation/widgets/newest_book_item.dart';
import 'package:bibliogo/features/search/presentations/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchBooksList extends StatelessWidget {
  const SearchBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return SliverList.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return NewestBookItem(bookModel: state.books[index]);
            },
          );
        } else if (state is SearchBooksLoading) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SpinKitFadingCube(
                size: 100,
                color: Colors.deepPurpleAccent,
              ),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(child: Text("Nothing to show...")),
          );
        }
      },
    );
  }
}
