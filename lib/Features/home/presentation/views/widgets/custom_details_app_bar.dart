import 'package:bookly_app/Features/favourites/presentation/view_model/fav_cubit/favourite_cubit.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomDetailsAppBar extends StatelessWidget {
  const CustomDetailsAppBar({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.pink.withAlpha(50),
                    Colors.pink.withAlpha(30),
                    Colors.pink.withAlpha(20),
                  ],
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                ),

                borderRadius: BorderRadius.circular(100),
                border: Border(
                  top: BorderSide(
                    color: Colors.pink.withAlpha(100),
                    width: 0.8,
                  ),
                ),
              ),
              child: Icon(
                Icons.close,
                // size: 20,
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.pink.withAlpha(50),
                    Colors.pink.withAlpha(30),
                    Colors.pink.withAlpha(20),
                  ],
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                ),

                borderRadius: BorderRadius.circular(100),
                border: Border(
                  top: BorderSide(
                    color: Colors.pink.withAlpha(100),
                    width: 0.8,
                  ),
                ),
              ),
              child: BlocBuilder<FavouriteCubit, FavouriteState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<FavouriteCubit>(
                        context,
                      ).toggleFavourite(book);
                      BlocProvider.of<FavouriteCubit>(context).loadFavorites();
                    },
                    child:
                        BlocProvider.of<FavouriteCubit>(
                          context,
                        ).isFavourite(book.id)
                        ? Image.asset(
                            'assets/icons/bookmark_fill.png',
                            height: 22,
                            color: Colors.red,
                          )
                        : Image.asset(
                            'assets/icons/bookmark_fill.png',
                            height: 22,
                            color: Colors.white,
                          ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
