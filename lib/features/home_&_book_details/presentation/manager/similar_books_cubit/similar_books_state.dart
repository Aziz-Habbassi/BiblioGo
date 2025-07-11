part of 'similar_books_cubit.dart';

sealed class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> similarBooks;

  SimilarBooksSuccess({required this.similarBooks});
}

final class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  SimilarBooksFailure({required this.errMessage});
}

final class SimilarBooksLoading extends SimilarBooksState {}
