import 'package:bibliogo/core/errors/failures.dart';
import 'package:bibliogo/core/models/book_model/book_model.dart';
import 'package:bibliogo/core/utils/api_service.dart';
import 'package:bibliogo/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;
  SearchRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<BookModel>>> searchBooks({
    required String subject,
  }) async {
    try {
      final List<BookModel> list = [];
      final Map<String, dynamic> books = await apiService.get(
        endpoint: "volumes?q=$subject&maxResults=20",
      );
      for (var item in books['items']) {
        list.add(BookModel.fromJson(item));
      }
      return right(list);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDrioError(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
