import 'package:bibliogo/core/cubits/cubit/change_theme_cubit.dart';
import 'package:bibliogo/features/views/home_view/home_view.dart';
import 'package:bibliogo/features/views/splash_view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return MaterialApp(
            routes: {
              SplashView.id: (context) => SplashView(),
              HomeView.id: (context) => HomeView(),
            },
            theme: BlocProvider.of<ChangeThemeCubit>(context).themeData,
            initialRoute: SplashView.id,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
