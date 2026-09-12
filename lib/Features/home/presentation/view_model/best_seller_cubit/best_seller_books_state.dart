part of 'best_seller_books_cubit.dart';

abstract class BestSellerBooksState extends Equatable {
  const BestSellerBooksState();

  @override
  List<Object> get props => [];
}

class BestSellerBooksInitial extends BestSellerBooksState {}

class BestSellerBooksLoading extends BestSellerBooksState {}

class BestSellerBooksSuccess extends BestSellerBooksState {
  final List<BookModel> books;
  const BestSellerBooksSuccess(this.books);
}

class BestSellerBooksError extends BestSellerBooksState {
  final String errorMessage;
  const BestSellerBooksError(this.errorMessage);
}
// pagination states :

class BestSellerBooksPaginationLoading extends BestSellerBooksState {
  final List<BookModel> prevBooks;

 const BestSellerBooksPaginationLoading({required this.prevBooks});
}

class BestSellerBooksPaginationFailure extends BestSellerBooksState {
  final String errorMessage;
  const BestSellerBooksPaginationFailure(this.errorMessage);
}
