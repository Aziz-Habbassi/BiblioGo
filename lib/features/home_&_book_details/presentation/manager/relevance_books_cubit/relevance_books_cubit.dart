import 'package:bibliogo/core/models/book_model/book_model.dart';
import 'package:bibliogo/features/home_&_book_details/data/repos/home_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'relevance_books_state.dart';

class RelevanceBooksCubit extends Cubit<RelevanceBooksState> {
  RelevanceBooksCubit(this.homeRepoImpl) : super(RelevanceBooksInitial());
  final HomeRepoImpl homeRepoImpl;
  Future<void> fetchRevelanceBooks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? category = prefs.getString("category");
    emit(RelevanceBooksLoading());
    final result = await homeRepoImpl.fetchFeaturedBooks(category: category!);
    result.fold(
      (failure) {
        emit(RelevanceBooksFailure(errMessage: failure.errMessage));
      },
      (books) {
        emit(RelevanceBooksSuccess(books: books));
      },
    );
  }
}
