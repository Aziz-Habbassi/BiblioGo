import 'package:bibliogo/core/cubits/themes_cubit/change_theme_cubit.dart';
import 'package:bibliogo/core/utils/app_router.dart';
import 'package:bibliogo/core/utils/service_locator.dart';
import 'package:bibliogo/features/home_&_book_details/data/repos/home_repo_impl.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/manager/relevance_books_cubit/relevance_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setup();
  runApp(const BiblioGo());
}

class BiblioGo extends StatelessWidget {
  const BiblioGo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChangeThemeCubit()),
        BlocProvider(
          create: (context) =>
              RelevanceBooksCubit(getIt.get<HomeRepoImpl>())
                ..fetchRevelanceBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewestBooks(),
        ),
      ],
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
