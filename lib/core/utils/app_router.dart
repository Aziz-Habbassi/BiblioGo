import 'package:bibliogo/core/utils/service_locator.dart';
import 'package:bibliogo/features/home_&_book_details/data/models/book_model/book_model.dart';
import 'package:bibliogo/features/home_&_book_details/data/repos/home_repo_impl.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/views/book_details_view.dart';
import 'package:bibliogo/features/home_&_book_details/presentation/views/home_view.dart';
import 'package:bibliogo/features/search/presentations/views/search_view.dart';
import 'package:bibliogo/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String routehomeview = "/homeview";
  static const String routebookdetailsview = "/BookDetailsView";
  static const String routesearchview = "/seachView";
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: routehomeview,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: routebookdetailsview,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child: BookDetailsView(bookModel: state.extra as BookModel),
          );
        },
      ),
      GoRoute(
        path: routesearchview,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        },
      ),
    ],
  );
}
