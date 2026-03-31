import 'package:bookly_app/Features/home/presentation/views/book_details_page.dart';
import 'package:bookly_app/Features/home/presentation/views/home_page.dart';
import 'package:bookly_app/Features/splash/presentation/views/splash_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static String kHomePage = '/homePage';
  static String kBoookDetails = '/bookDetails';

  static final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: kHomePage,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: kBoookDetails,
      builder: (context, state) => const BookDetailsPage(),
    ),

  ],
);
}