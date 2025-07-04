import 'package:bibliogo/features/search/presentations/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 3),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                BlocProvider.of<SearchBooksCubit>(
                  context,
                ).searchBooks(subject: controller.text);
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
    );
  }
}
