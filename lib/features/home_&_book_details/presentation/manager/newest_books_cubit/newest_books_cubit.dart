import 'package:bibliogo/core/models/book_model/book_model.dart';
import 'package:bibliogo/features/home_&_book_details/data/repos/home_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepoImpl) : super(NewestBooksInitial());
  final HomeRepoImpl homeRepoImpl;
  Future<void> fetchNewestBooks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? category = prefs.getString("category");
    emit(NewestBooksLoading());
    final result = await homeRepoImpl.fetchNewestBooks(category: category!);
    result.fold(
      (failure) {
        emit(NewestBooksFailure(errMessage: failure.errMessage));
      },
      (books) {
        emit(NewestBooksSuccess(books: books));
      },
    );
  }
}
