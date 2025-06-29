import 'package:bibliogo/features/home_&_book_details/data/models/book_model/book_model.dart';
import 'package:bibliogo/features/home_&_book_details/data/repos/home_repo_impl.dart';
import 'package:bloc/bloc.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepoImpl) : super(NewestBooksInitial());
  final HomeRepoImpl homeRepoImpl;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    final result = await homeRepoImpl.fetchFeaturedBooks();
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
