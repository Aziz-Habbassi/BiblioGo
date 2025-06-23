import 'package:bibliogo/core/cubits/cubit/change_theme_cubit.dart';
import 'package:bibliogo/features/views/splash_view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const BiblioGo());
}

class BiblioGo extends StatelessWidget {
  const BiblioGo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeThemeCubit(),
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, state) {
          return GetMaterialApp(
            theme: BlocProvider.of<ChangeThemeCubit>(context).themeData,
            home: const SplashView(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
