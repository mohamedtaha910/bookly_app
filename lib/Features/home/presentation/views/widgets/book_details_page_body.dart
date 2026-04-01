import 'package:bookly_app/Features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_cover.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_button.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_details_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/similiar_books_list_view.dart';
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
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
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
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text('You can also like', style: Styles.textStyle16)],
            ),
            SizedBox(height: 16),
            SimiliarbooksListView(),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}



