// import 'package:bookly_app/Features/home/presentation/view_model/best_seller_cubit/best_seller_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class BestBooksList extends StatelessWidget {
  const BestBooksList({super.key, required this.books, this.endSpace = 24});
  final List<BookModel> books;
  final double endSpace;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: books.length,
      itemBuilder: (context, index) => Column(
        children: [
          BookItem(bookModel: books[index]),
          SizedBox(height: 24),
          index == books.length - 1
              ? SizedBox(height: endSpace)
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 42),
                  width: double.infinity,
                  height: 1,
                  color: Colors.white10,
                ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
