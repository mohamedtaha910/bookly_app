import 'package:bookly_app/Features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key, required this.books});
  final List<BookModel> books;

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
              ? const SizedBox(height: 65)
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 42),
                  width: double.infinity,
                  height: 1,
                  color: Colors.white10,
                ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
