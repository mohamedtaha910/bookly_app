import 'package:bookly_app/Features/favourites/presentation/view_model/fav_cubit/favourite_cubit.dart';
import 'package:bookly_app/Features/favourites/presentation/views/widgets/Custom_dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavouriteAppBar extends StatelessWidget {
  const FavouriteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Favourite Books', style: TextStyle(fontSize: 20)),
        const Spacer(),
        BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<FavouriteCubit>(context).books.isEmpty
                    ? null
                    : confirmDelete(context);
              },
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  // color: Colors.white10,
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withAlpha(60),
                      Colors.white.withAlpha(40),
                      Colors.white.withAlpha(10),
                    ],
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                  ),
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.withAlpha(120),
                      width: 0.95,
                    ),
                  ),
                ),
                child: BlocProvider.of<FavouriteCubit>(context).books.isEmpty
                    ? Icon(Icons.delete_forever, size: 25, color: Colors.grey)
                    : Icon(Icons.delete_sweep_rounded, size: 26),
              ),
            );
          },
        ),
      ],
    );
  }

  confirmDelete(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  // color: Colors.white10,
                  gradient: LinearGradient(
                    colors: [
                      Colors.pink.withAlpha(100),
                      Colors.pink.withAlpha(50),
                      Colors.pink.withAlpha(30),
                    ],
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                  ),
                  border: Border(
                    top: BorderSide(
                      color: Colors.pink.withAlpha(120),
                      width: 0.8,
                    ),
                  ),
                ),
                child: Icon(Icons.delete_sweep_rounded, size: 36),
              ),
              SizedBox(height: 24),
              Text(
                'Are you sure you want to clear all your favourites? ',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomDialogButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    verticalPadding: 2,
                    horizintalPadding: 24,
                    text: 'Cancel',
                    buttonColor: Colors.white.withAlpha(10),
                    textColor: Colors.white,
                    isBorder: true,
                  ),
                  CustomDialogButton(
                    onPressed: () {
                      BlocProvider.of<FavouriteCubit>(
                        context,
                      ).clearFavourites();
                      BlocProvider.of<FavouriteCubit>(context).books = [];
                      GoRouter.of(context).pop();
                    },
                    verticalPadding: 2,
                    horizintalPadding: 24,
                    text: 'Delete',
                    buttonColor: Colors.pink,
                    textColor: Colors.white,
                    isBorder: true,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
