import 'package:bibliogo/features/home_&_book_details/data/models/book_model/book_model.dart';
import 'package:bibliogo/features/home_&_book_details/data/repos/home_repo_impl.dart';
import 'package:bloc/bloc.dart';

part 'relevance_books_state.dart';

class RelevanceBooksCubit extends Cubit<RelevanceBooksState> {
  RelevanceBooksCubit(this.homeRepoImpl) : super(RelevanceBooksInitial());
  final HomeRepoImpl homeRepoImpl;
  Future<void> fetchRevelanceBooks() async {
    emit(RelevanceBooksLoading());
    final result = await homeRepoImpl.fetchFeaturedBooks();
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
