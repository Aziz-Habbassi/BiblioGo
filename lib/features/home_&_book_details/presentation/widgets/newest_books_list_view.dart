import 'package:bibliogo/features/home_&_book_details/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/newest_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return NewestBookItem(bookModel: state.books[index]);
            },
          );
        } else if (state is NewestBooksLoading) {
          return SliverToBoxAdapter(
            child: SpinKitFadingCube(size: 100, color: Colors.deepPurpleAccent),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(child: Icon(Icons.error, size: 64)),
          );
        }
      },
    );
  }
}
