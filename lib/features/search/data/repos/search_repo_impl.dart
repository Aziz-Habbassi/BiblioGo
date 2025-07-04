import 'package:bibliogo/core/errors/failures.dart';
import 'package:bibliogo/core/models/book_model/book_model.dart';
import 'package:bibliogo/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImpl extends SearchRepo {
  @override
  Future<Either<Failures, List<BookModel>>> searchBooks({
    required String subject,
  }) async {
    // TODO: implement searchBooks
    throw UnimplementedError();
  }
}
