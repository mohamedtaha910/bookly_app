import 'package:bookly_app/Features/home/presentation/views/widgets/banners_list_view.dart';
// import 'package:bookly_app/Features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/best_books_list_view.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return
    // Stack(
    // children: [
    SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100),
          // CustomAppBar(),
          // SizedBox(height: 16),
          SizedBox(height: 6),
          BannersListView(),
          SizedBox(height: 24),
          // SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Best Seller', style: Styles.textStyle18),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: const BestBooksListView(),
          ),
        ],
      ),
    );

    // Positioned(
    //   top: 0,
    //   right: 0,
    //   left: 0,
    //   child: Container(
    //     padding: EdgeInsets.symmetric(horizontal: 16),
    //     height: 75,
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //         colors: [
    //           kPrimaryColor,
    //           kPrimaryColor.withAlpha(220),
    //           kPrimaryColor.withAlpha(200),
    //           kPrimaryColor.withAlpha(150),
    //           kPrimaryColor.withAlpha(100),
    //           kPrimaryColor.withAlpha(50),
    //           kPrimaryColor.withAlpha(0),
    //         ],
    //         begin: AlignmentGeometry.topCenter,
    //         end: AlignmentGeometry.bottomCenter,
    //       ),
    //     ),
    //     child: Align(
    //       alignment: AlignmentGeometry.topCenter,
    //       child: CustomAppBar(),
    //     ),
    //   ),
    // ),
    // ],
    // );
  }
}
