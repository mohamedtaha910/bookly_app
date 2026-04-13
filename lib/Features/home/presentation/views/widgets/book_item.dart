import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBoookDetails , extra: bookModel);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // height: 135,
            // width: 90,
            height: 123,
            width: 85,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white10),
              image: DecorationImage(
                fit: BoxFit.fill,
                // image: AssetImage('assets/photo/cover2.jpg'),
                image: NetworkImage(
                  bookModel.volumeInfo.imageLinks?.thumbnail ?? 'https://www.cineciutat.org/storage/app/uploads/public/68a/f96/5dc/68af965dc2d09472226121.jpg',
                ),
              ),
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.white10,
                  offset: Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookModel.volumeInfo.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle20.copyWith(
                    fontSize: 18,
                    fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                    fontWeight: FontWeight.normal,
                  ),
                ),

                SizedBox(height: 6),
                Text(
                  bookModel.volumeInfo.authors?[0] ?? 'Unknown Author',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    // SizedBox(width: 4),
                    PriceBadge(price: 'Free'),
                    Spacer(),
                    RatingBadge(rating: 3.7),
                    SizedBox(width: 5),
                    Text(' (2242)', style: Styles.textStyle14),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PriceBadge extends StatelessWidget {
  const PriceBadge({super.key, this.price});
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.pink.withAlpha(25),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.attach_money_rounded, size: 20, color: Colors.deepOrange),
          SizedBox(width: 4),
          Text(
            '$price ',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class RatingBadge extends StatelessWidget {
  const RatingBadge({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.amber.withAlpha(25),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(FontAwesomeIcons.solidStar, color: Colors.amber, size: 14),
          SizedBox(width: 6),
          Text(
            rating.toString(),
            style: Styles.textStyle14.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
