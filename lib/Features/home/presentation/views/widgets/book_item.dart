import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
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
        GoRouter.of(context).push(AppRouter.kBoookDetails, extra: bookModel);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // height: 135,
            // width: 90,
            height: 130,
            width: 90,
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.6,
                color: Colors.white38.withAlpha(50),
              ),
              image: DecorationImage(
                fit: BoxFit.fill,
                // image: AssetImage('assets/photo/cover2.jpg'),
                image: NetworkImage(
                  bookModel.volumeInfo.imageLinks?.thumbnail ??
                      'https://www.cineciutat.org/storage/app/uploads/public/68a/f96/5dc/68af965dc2d09472226121.jpg',
                ),
              ),
              borderRadius: BorderRadius.circular(6),

              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 1),
                  blurRadius: 6,
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
                    fontSize: 17,
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
                    Text('( 2242 )', style: Styles.textStyle14),
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.pink.withAlpha(40),
            Colors.pink.withAlpha(20),
            Colors.pink.withAlpha(20),
          ],
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
        ),

        borderRadius: BorderRadius.circular(100),
        border: Border(
          top: BorderSide(color: Colors.pink.withAlpha(50), width: 0.8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.attach_money_rounded, size: 20, color: Colors.deepOrange),
          SizedBox(width: 3),
          Text(
            '$price ',
            style: Styles.textStyle14.copyWith(
              fontSize: 13,
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.amber.withAlpha(40),
            Colors.amber.withAlpha(30),
            Colors.amber.withAlpha(20),
          ],
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
        ),

        borderRadius: BorderRadius.circular(100),
        border: Border(
          top: BorderSide(color: Colors.amber.withAlpha(50), width: 0.8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(FontAwesomeIcons.solidStar, color: Colors.amber, size: 13),
          SizedBox(width: 6),
          Text(
            rating.toString(),
            style: Styles.textStyle14.copyWith(
              fontSize: 12.5,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
