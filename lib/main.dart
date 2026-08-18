import 'package:bookly_app/Features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/Features/home/presentation/view_model/best_seller_cubit/best_seller_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:flutter/services.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookModelAdapter()); //register 

  await Hive.openBox<BookModel>(kBooksBox);
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FeaturedBooksCubit>(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImplementation>())
                ..fetchFeaturedBooks(),
        ),
        BlocProvider<BestSellerBooksCubit>(
          create: (context) =>
              BestSellerBooksCubit(getIt.get<HomeRepoImplementation>())
                ..fetchBestSellerBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,

          // appBarTheme: const AppBarTheme(
          //   systemOverlayStyle: SystemUiOverlayStyle(
          //     statusBarColor: kPrimaryColor,
          //     statusBarIconBrightness: Brightness.dark,
          //   ),
          // ),
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
