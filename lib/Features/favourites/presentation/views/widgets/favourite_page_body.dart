import 'package:bookly_app/Features/favourites/presentation/view_model/fav_cubit/favourite_cubit.dart';
import 'package:bookly_app/Features/favourites/presentation/views/widgets/no_favourite.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/searched_books_list_view.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePageBody extends StatelessWidget {
  const FavouritePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (context, state) {
        if (state is FavouriteSuccess) {
          List<BookModel> books = BlocProvider.of<FavouriteCubit>(
            context,
          ).books;
          if (books.isEmpty || books == []) {
            return NoFavourite();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: 28),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SearchedBookListView(books: books),
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          );
        }
        if (state is FavouriteLoading) {
          return const CustomLoadingIndicator(
            paddingValue: 36,
            height: 25,
            width: 25,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
