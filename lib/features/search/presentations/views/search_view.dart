import 'package:bibliogo/core/utils/app_router.dart';
import 'package:bibliogo/core/utils/styles.dart';
import 'package:bibliogo/core/widgets/custom_text_field.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/manager/relevance_books_cubit/relevance_books_cubit.dart';
import 'package:bibliogo/features/search/presentations/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bibliogo/features/search/presentations/widgets/search_books_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formkey = GlobalKey();
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        autovalidateMode: autovalidateMode,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SafeArea(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              context.go(AppRouter.routehomeview);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 32,
                              color: Colors.greenAccent,
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return "Fill the Field to search";
                                } else {
                                  value = data;
                                  return null;
                                }
                              },
                              onpressed: () async {
                                final SearchBooksCubit searchBooksCubit =
                                    BlocProvider.of<SearchBooksCubit>(context);
                                final RelevanceBooksCubit relevanceBooksCubit =
                                    BlocProvider.of<RelevanceBooksCubit>(
                                      context,
                                    );
                                final NewestBooksCubit newestBooksCubit =
                                    BlocProvider.of<NewestBooksCubit>(context);
                                if (formkey.currentState!.validate()) {
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString("category", value!);
                                  searchBooksCubit.searchBooks(subject: value!);
                                  relevanceBooksCubit.fetchRevelanceBooks();
                                  newestBooksCubit.fetchNewestBooks();
                                } else {
                                  autovalidateMode = AutovalidateMode.always;
                                  setState(() {});
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Search Result",
                      style: Styles.style1.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SearchBooksList(),
          ],
        ),
      ),
    );
  }
}
