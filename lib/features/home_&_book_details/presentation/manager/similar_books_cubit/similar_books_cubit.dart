import 'package:bibliogo/core/errors/failures.dart';
import 'package:bibliogo/features/home_&_book_details/data/models/book_model/book_model.dart';
import 'package:bibliogo/features/home_&_book_details/data/repos/home_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepoImpl) : super(SimilarBooksInitial());
  final HomeRepoImpl homeRepoImpl;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    final Either<Failures, List<BookModel>> result = await homeRepoImpl
        .fetchSimilarBooks(category: category);
    result.fold(
      (failure) {
        emit(SimilarBooksFailure(errMessage: failure.errMessage));
      },
      (similarBooks) {
        emit(SimilarBooksSuccess(similarBooks: similarBooks));
      },
    );
  }
}
