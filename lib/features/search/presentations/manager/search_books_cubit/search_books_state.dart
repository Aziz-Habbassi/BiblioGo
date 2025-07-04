part of 'search_books_cubit.dart';

@immutable
sealed class SearchBooksState {}

final class SearchBooksInitial extends SearchBooksState {}

final class SearchBooksSuccess extends SearchBooksState {}

final class SearchBooksLoading extends SearchBooksState {}

final class SearchBooksFailed extends SearchBooksState {}
