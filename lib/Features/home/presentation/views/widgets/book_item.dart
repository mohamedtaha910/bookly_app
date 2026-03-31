import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
              image: AssetImage('assets/photo/cover2.jpg'),
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
                'Harry Potter and the Goblet of Fire',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle20.copyWith(
                  fontSize: 19,
                  fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                  fontWeight: FontWeight.normal,
                ),
              ),

              SizedBox(height: 6),
              Text(
                'J.K. Rowling',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  // SizedBox(width: 4),
                  PriceBadge(),
                  Spacer(),
                  RatingBadge(),
                  SizedBox(width: 5),
                  Text(' (2242)', style: Styles.textStyle14),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PriceBadge extends StatelessWidget {
  const PriceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.pink.withAlpha(25),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text('41.5 €', style: Styles.textStyle16),
    );
  }
}

class RatingBadge extends StatelessWidget {
  const RatingBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.amber.withAlpha(25),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          FaIcon(FontAwesomeIcons.solidStar, color: Colors.amber, size: 14),
          SizedBox(width: 6),
          Text(
            '8.4',
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
