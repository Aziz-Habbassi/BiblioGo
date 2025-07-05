import 'package:bibliogo/core/utils/app_router.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/manager/relevance_books_cubit/relevance_books_cubit.dart';
import 'package:bibliogo/features/search/presentations/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({super.key});

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  final GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.go(AppRouter.routehomeview);
            },
            icon: Icon(Icons.arrow_back, size: 32, color: Colors.greenAccent),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              validator: (data) {
                if (data!.isEmpty) {
                  return "Fill the Field to search";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.deepPurpleAccent,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.deepPurpleAccent,
                    width: 3,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    final SearchBooksCubit searchBooksCubit =
                        BlocProvider.of<SearchBooksCubit>(context);
                    final RelevanceBooksCubit relevanceBooksCubit =
                        BlocProvider.of<RelevanceBooksCubit>(context);
                    final NewestBooksCubit newestBooksCubit =
                        BlocProvider.of<NewestBooksCubit>(context);
                    if (formkey.currentState!.validate()) {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("category", controller.text);
                      searchBooksCubit.searchBooks(subject: controller.text);
                      relevanceBooksCubit.fetchRevelanceBooks();
                      newestBooksCubit.fetchNewestBooks();
                    }
                  },
                  icon: Icon(
                    Icons.search_rounded,
                    size: 32,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
