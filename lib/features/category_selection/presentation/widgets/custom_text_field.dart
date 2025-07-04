import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
              if (formkey.currentState!.validate()) {}
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
