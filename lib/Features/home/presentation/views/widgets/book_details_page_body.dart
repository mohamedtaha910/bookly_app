import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_cover.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_button.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_details_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/similiar_books_list_view.dart';
import 'package:bookly_app/core/functions/launch_url.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookDetailsPageBody extends StatelessWidget {
  const BookDetailsPageBody({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CustomDetailsAppBar(book: book),
            SizedBox(height: 16),
            CustomBookCover(
              imageUrl:
                  book.volumeInfo.imageLinks?.thumbnail ??
                  'https://www.cineciutat.org/storage/app/uploads/public/68a/f96/5dc/68af965dc2d09472226121.jpg',
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Text(
                book.volumeInfo.title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle30,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8),
            Text(
              book.volumeInfo.authors == null
                  ? 'UnKnown Author'
                  : book.volumeInfo.authors![0],
              style: Styles.textStyle14,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Wrap(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.end,
              alignment: WrapAlignment.center,
              runSpacing: 10,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 2.7,
                  ),
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

                    borderRadius: BorderRadius.circular(200),
                    border: Border(
                      top: BorderSide(
                        color: Colors.pink.withAlpha(50),
                        width: 0.8,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        CupertinoIcons.ticket_fill,
                        size: 20,
                        color: Colors.deepOrange,
                      ),
                      SizedBox(width: 6),
                      Text(
                        book.volumeInfo.categories == null
                            ? 'UnCategorized'
                            : book.volumeInfo.categories![0],
                        style: Styles.textStyle14.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 12),
                RatingBadge(rating: 4.5, textSize: 13, iconSize: 14),
                SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 3,
                  ),
                  child: Text('(2390)', style: Styles.textStyle14),
                ),
              ],
            ),
            SizedBox(height: 24),
            CustomButton(
              onPressed: () {
                launchCustomUrl(context, book.volumeInfo.previewLink);
              },
            ),
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
