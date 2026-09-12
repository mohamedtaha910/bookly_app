// import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'best_seller_books_state.dart';

class BestSellerBooksCubit extends Cubit<BestSellerBooksState> {
  BestSellerBooksCubit(this.homeRepo) : super(BestSellerBooksInitial());
  final HomeRepo homeRepo;

  List<BookModel> books = [];

  Future<void> fetchBestSellerBooks({int pageNum = 0}) async {
    if (pageNum == 0) {
      emit(BestSellerBooksLoading());
    } else {
      emit(BestSellerBooksPaginationLoading(prevBooks: books));
    }
    var result = await homeRepo.fetchBestSellerBooks(pageNum: pageNum);
    result.fold(
      (failure) {
        if (pageNum == 0) {
          emit(BestSellerBooksError(failure.errorMessage));
        } else {
          emit(BestSellerBooksPaginationFailure(failure.errorMessage));
        }
      },
      (booksList) {
        books.addAll(booksList);
        emit(BestSellerBooksSuccess(books));
      },
    );
  }
}
