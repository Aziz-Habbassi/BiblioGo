import 'package:bibliogo/core/models/book_model/book_model.dart';
import 'package:bibliogo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks({
    required String category,
  });
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks({
    required String category,
  });
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks({
    required String category,
  });
}
