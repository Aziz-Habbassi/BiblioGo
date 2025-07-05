import 'package:bibliogo/core/utils/app_router.dart';
import 'package:bibliogo/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategorySelectionView extends StatefulWidget {
  const CategorySelectionView({super.key});

  @override
  State<CategorySelectionView> createState() => _CategorySelectionViewState();
}

class _CategorySelectionViewState extends State<CategorySelectionView> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Choose The Category you want",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "SectraFine",
                  fontSize: 32,
                  color: Colors.greenAccent,
                ),
              ),

              const Text("(This only for The First Time)"),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
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
                    if (formkey.currentState!.validate()) {
                      final void navigate = context.go(AppRouter.routehomeview);
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("category", value!);
                      navigate;
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
      ),
    );
  }
}
