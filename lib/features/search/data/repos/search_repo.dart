import 'package:bibliogo/core/errors/failures.dart';
import 'package:bibliogo/core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<BookModel>>> searchBooks({
    required String subject,
  });
}
