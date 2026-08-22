import 'package:bookly_app/Features/favourites/data/repos/favourite_repo.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:hive/hive.dart';

class FavouriteRepoImplementation implements FavouriteRepo {
  var booksBox = Hive.box<BookModel>(kBooksBox);
  @override
  void toggleFavourite(BookModel book)  {
    if (isFavourite(book.id)) {
      booksBox.delete(book.id);
    } else {
      booksBox.put(book.id, book);
    }
  }

  @override
  void clearFavourites() {
    booksBox.clear();
    
  }

  @override
  List<BookModel> fetchAllFavourites() {
    return booksBox.values.toList();
  }

  @override
  bool isFavourite(String? id) {
    return booksBox.containsKey(id);
  }
}
