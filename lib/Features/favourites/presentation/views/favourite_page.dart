import 'package:bookly_app/Features/favourites/presentation/views/widgets/fav_app_bar.dart';
import 'package:bookly_app/Features/favourites/presentation/views/widgets/favourite_page_body.dart';
import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 35, sigmaY: 10),
            child: AppBar(
              elevation: 0,
              // foregroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              backgroundColor: kPrimaryColor.withAlpha(200),
              title: FavouriteAppBar(),
              // toolbarHeight: 65,
            ),
          ),
        ),
      ),
      body: FavouritePageBody(),
    );
  }
}
