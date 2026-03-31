import 'package:bookly_app/Features/home/presentation/views/home_page.dart';
import 'package:bookly_app/Features/splash/presentation/views/splash_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static String kHomePage = '/homePage';
  static final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/homePage',
      builder: (context, state) => const HomePage(),
    ),

  ],
);
}