import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks({
    required String searchQuery,
  }) async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?key=AIzaSyAdzsxBmUBt1NSxx8nrztWJ6CLWVX3Jai4&Filtering=free-ebooks&Sorting=newest&q=$searchQuery',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure('There is no book found!'));
    }
  }
}
