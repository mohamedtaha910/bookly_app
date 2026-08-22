// import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/favourites/data/repos/favourite_repo.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit({required this.favouriteRepo}) : super(FavouriteInitial());
  final FavouriteRepo favouriteRepo;
  List<BookModel> books = [];

  void loadFavorites() {
    emit(FavouriteLoading());
    books = favouriteRepo.fetchAllFavourites();
    emit(FavouriteSuccess(books: books));
  }

  void toggleFavourite(BookModel book) {
    emit(FavouriteLoading());
    favouriteRepo.toggleFavourite(book);
    loadFavorites();
    emit(FavouriteSuccess(books: books));
  }

  void clearFavourites() {
    // emit(FavouriteLoading());
    favouriteRepo.clearFavourites();
    books = [];
    loadFavorites();
    emit(FavouriteSuccess(books:books));
  }

  bool isFavourite(String? id) {
    return favouriteRepo.isFavourite(id);
  }
}
