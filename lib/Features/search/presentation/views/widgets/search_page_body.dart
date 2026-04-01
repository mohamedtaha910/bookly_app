import 'package:bookly_app/Features/home/presentation/views/widgets/books_list_view.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_bar.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 24),
            Row(
              children: [
                GestureDetector(
                  onTap: () => GoRouter.of(context).pop(),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 22,
                    color: Colors.white54,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(child: CustomSerchBar()),
              ],
            ),
            SizedBox(height: 42),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  8.0),
              child: BooksListView(),
            ),
          ],
        ),
      ),
    );
  }
}
