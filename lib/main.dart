import 'package:bibliogo/core/cubits/themes_cubit/change_theme_cubit.dart';
import 'package:bibliogo/core/utils/app_router.dart';

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
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            theme: BlocProvider.of<ChangeThemeCubit>(context).themeData,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
