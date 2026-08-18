import 'package:bookly_app/Features/favourites/presentation/views/favourite_page.dart';
import 'package:bookly_app/Features/home/presentation/views/app_root.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo_implementation.dart';
import 'package:bookly_app/Features/search/presentation/view_model/search_books_cubit.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/Features/home/presentation/view_model/similar_books_cubit/similar_book_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/book_details_page.dart';
import 'package:bookly_app/Features/home/presentation/views/home_page.dart';
import 'package:bookly_app/Features/search/presentation/views/search_page.dart';
import 'package:bookly_app/Features/splash/presentation/views/splash_page.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static String kHomePage = '/homePage';
  static String kBoookDetails = '/bookDetails';
  static String kSearchPage = '/searchPage';
  static String kFavPage = '/FfavouritePage';
  static String kRootPage = '/rootPage';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashPage()),
      GoRoute(path: kHomePage, builder: (context, state) => const HomePage()),
      GoRoute(
        path: kBoookDetails,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SimilarBookCubit(getIt.get<HomeRepoImplementation>()),
          child: BookDetailsPage(book: state.extra as BookModel),
        ),
      ),
      GoRoute(
        path: kSearchPage,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SearchBooksCubit(getIt.get<SearchRepoImplementation>()),
          child: SearchPage(isBack: true),
        ),
      ),
      GoRoute(path: kFavPage, builder: (context, state) => FavouritePage()),
      GoRoute(path: kRootPage, builder: (context, state) => AppRoot()),
    ],
  );
}
