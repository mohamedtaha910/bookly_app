import 'package:bookly_app/core/models/book_model/book_model.dart';

abstract class FavouriteRepo {
  bool isFavourite(String? id);

  void toggleFavourite(BookModel book);

  List<BookModel> fetchAllFavourites();

  void clearFavourites();
}
