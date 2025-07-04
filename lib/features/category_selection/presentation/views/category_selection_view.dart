import 'package:bibliogo/features/category_selection/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CategorySelectionView extends StatelessWidget {
  const CategorySelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Choose The Category you want",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "SectraFine",
                fontSize: 32,
                color: Colors.greenAccent,
              ),
            ),

            Text("(This only for The First Time)"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: CustomTextField(),
            ),
          ],
        ),
      ),
    );
  }
}
