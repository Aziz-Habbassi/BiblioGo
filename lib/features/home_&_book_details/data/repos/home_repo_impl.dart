import 'package:bibliogo/core/errors/failures.dart';
import 'package:bibliogo/core/utils/api_service.dart';
import 'package:bibliogo/core/models/book_model/book_model.dart';
import 'package:bibliogo/features/home_&_book_details/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks({
    required String category,
  }) async {
    try {
      final Map<String, dynamic> list = await apiService.get(
        endpoint:
            "volumes?q=$category&maxResults=20&orderBy=newest&download=epub",
      );
      List<BookModel> books = [];
      for (var item in list['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDrioError(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks({
    required String category,
  }) async {
    try {
      final Map<String, dynamic> list = await apiService.get(
        endpoint: "volumes?q=$category&maxResults=20",
      );
      List<BookModel> books = [];
      for (var item in list['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDrioError(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      final Map<String, dynamic> list = await apiService.get(
        endpoint: "volumes?q=$category&orderBy=relevance",
      );
      List<BookModel> books = [];
      for (var item in list['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDrioError(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
