import 'package:bookly_app/Features/favourites/presentation/views/favourite_page.dart';
import 'package:bookly_app/Features/home/presentation/views/home_page.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_nav_bar.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo_implementation.dart';
import 'package:bookly_app/Features/search/presentation/view_model/search_books_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/search_page.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    BlocProvider(
      create: (context) =>
          SearchBooksCubit(getIt.get<SearchRepoImplementation>()),
      child: SearchPage(isBack: false),
    ),
    FavouritePage(),
    // CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          pages[currentIndex],

          //  shadow
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Container(
              height: 45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    kPrimaryColor,
                    kPrimaryColor.withAlpha(50),
                    kPrimaryColor.withAlpha(10),

                    // Colors.transparent
                  ],
                ),
              ),
            ),
          ),

          LiquidGlassNavBar(
            currentIndex: currentIndex,
            onDestinationSelected: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
