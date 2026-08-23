import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/Banner_item.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannersListView extends StatelessWidget {
  const BannersListView({super.key});

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   physics: const BouncingScrollPhysics(),
    //   child: Row(
    //     children: [
    //       ...List.generate(20, (index) {
    //         return BannerItem();
    //       }),
    //     ],
    //   ),
    // );

    //======================================================
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksError) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
            iconSize: 50,
          );
        }
        if (state is FeaturedBooksSuccess) {
          List<BookModel> books = state.books;
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.28,
            width: double.infinity,
            child: CarouselSlider.builder(
              options: CarouselOptions(
                // aspectRatio: 1.7,
                viewportFraction: 0.44,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(seconds: 3),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                disableCenter: true,
              ),
              itemCount: books.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      BannerItem(bookModel: books[itemIndex]),
            ),
          );
        } else {
          return CustomLoadingIndicator(
            paddingValue: 36,
            height: 25,
            width: 25,
          );
        }
      },
    );
  }
}
