part of 'relevance_books_cubit.dart';

sealed class RelevanceBooksState {}

final class RelevanceBooksInitial extends RelevanceBooksState {}

final class RelevanceBooksLoading extends RelevanceBooksState {}

final class RelevanceBooksSuccess extends RelevanceBooksState {
  final List<BookModel> books;

  RelevanceBooksSuccess({required this.books});
}

final class RelevanceBooksFailure extends RelevanceBooksState {
  final String errMessage;

  RelevanceBooksFailure({required this.errMessage});
}
