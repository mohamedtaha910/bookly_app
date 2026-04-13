import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimiliarBookItem extends StatelessWidget {
  const SimiliarBookItem({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBoookDetails, extra: book);
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.19,
        child: AspectRatio(
          aspectRatio: 0.74,
          child: Container(
            margin: EdgeInsetsDirectional.only(end: 12),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  book.volumeInfo.imageLinks?.thumbnail ?? 'https://www.cineciutat.org/storage/app/uploads/public/68a/f96/5dc/68af965dc2d09472226121.jpg',
                ),
              ),
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 1),
                  blurRadius: 4,
                ),
              ]
              
      
            ),
          ),
        ),
      ),
    );
  }
}