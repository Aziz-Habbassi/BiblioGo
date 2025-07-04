import 'package:bibliogo/core/errors/failures.dart';
import 'package:bibliogo/core/models/book_model/book_model.dart';
import 'package:bibliogo/features/search/data/repos/search_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepoImpl) : super(SearchBooksInitial());
  final SearchRepoImpl searchRepoImpl;
  Future<void> searchBooks({required String subject}) async {
    emit(SearchBooksLoading());
    final Either<Failures, List<BookModel>> result = await searchRepoImpl
        .searchBooks(subject: subject);
    result.fold(
      (failure) {
        emit(SearchBooksFailed(errMessage: failure.errMessage));
      },
      (books) {
        emit(SearchBooksSuccess(books: books));
      },
    );
  }
}
