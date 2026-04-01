import 'package:bookly_app/Features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // padding: EdgeInsets.zero,
      // physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => Column(
        children: [
          const BookItem(),
          SizedBox(height: 24),
          index == 10 - 1 ? const SizedBox.shrink(): Container(
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