import 'package:bibliogo/core/cubits/cubit/change_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomesView extends StatelessWidget {
  const HomesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BiblioGo"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<ChangeThemeCubit>(context).changeTheme();
            },
            icon: Icon(Icons.sunny),
          ),
        ],
      ),
    );
  }
}
