import 'package:bookly_app/Features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_cover.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_details_app_bar.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookDetailsPageBody extends StatelessWidget {
  const BookDetailsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CustomDetailsAppBar(),
          SizedBox(height: 16),
          CustomBookCover(),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Text(
              'The Jungle Book',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle30,
            ),
          ),
          SizedBox(height: 8),
          Text('Rudyard Kipling', style: Styles.textStyle14),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBadge(),
              SizedBox(width: 6),
              Text('(2390)', style: Styles.textStyle14),
            ],
          ),
          SizedBox(height: 24),
          CustomButton(),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:  16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric( vertical: 20),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '19.99 ',
                    style: Styles.textStyle16.copyWith(color: Colors.black),
                  ),
                  // SizedBox(width: 6),
                  Text(
                    '€',
                    style: Styles.textStyle16.copyWith(
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(width: 0.5),
          Expanded(
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric( vertical: 20),
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
              ),
              child: Text(
                'Free Preview',
                style: Styles.textStyle16.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
