import 'package:bookly_app/core/widgets/book_shimmer.dart';
import 'package:flutter/material.dart';

class BooksShimmerList extends StatelessWidget {
  const BooksShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => Column(
        children: [
          BookShimmer(),
          SizedBox(height: 24),
          index == 10 - 1
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
