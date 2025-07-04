part of 'search_books_cubit.dart';

sealed class SearchBooksState {}

final class SearchBooksInitial extends SearchBooksState {}

final class SearchBooksSuccess extends SearchBooksState {
  final List<BookModel> books;

  SearchBooksSuccess({required this.books});
}

final class SearchBooksLoading extends SearchBooksState {}

final class SearchBooksFailed extends SearchBooksState {
  final String errMessage;

  SearchBooksFailed({required this.errMessage});
}
