import 'package:bibliogo/core/utils/app_router.dart';
import 'package:bibliogo/features/home_&_book_details/data/models/book_model/book_model.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/widgets/cover_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class SimilairBooksListView extends StatefulWidget {
  const SimilairBooksListView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<SimilairBooksListView> createState() => _SimilairBooksListViewState();
}

class _SimilairBooksListViewState extends State<SimilairBooksListView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
      category:
          widget.bookModel.volumeInfo!.categories?[0] ??
          widget.bookModel.volumeInfo!.title!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: 190,
            child: ListView.builder(
              itemCount: state.similarBooks.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.go(
                      AppRouter.routebookdetailsview,
                      extra: state.similarBooks[index],
                    );
                  },
                  child: CoverBookItem(
                    imageUrl:
                        state
                            .similarBooks[index]
                            .volumeInfo!
                            .imageLinks
                            ?.thumbnail ??
                        "",
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return Center(child: Icon(Icons.error, size: 64));
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 30),
            child: const SpinKitFadingCircle(
              size: 50,
              color: Colors.deepPurpleAccent,
            ),
          );
        }
      },
    );
  }
}
