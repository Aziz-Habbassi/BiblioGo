import 'package:bibliogo/core/errors/failures.dart';
import 'package:bibliogo/core/utils/api_service.dart';
import 'package:bibliogo/features/home_&_book_details/data/models/book_model/book_model.dart';
import 'package:bibliogo/features/home_&_book_details/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks() async {
    try {
      final Map<String, dynamic> list = await ApiService(
        dio: Dio(),
      ).get(endpoint: "volumes?q=habits&langRestrict=eng&orderBy=newest");
      List<BookModel> books = [];
      for (var item in list['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      final Map<String, dynamic> list = await ApiService(
        dio: Dio(),
      ).get(endpoint: "volumes?q=habits&langRestrict=eng&orderBy=relevance");
      List<BookModel> books = [];
      for (var item in list['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
