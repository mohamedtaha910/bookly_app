import 'package:bookly_app/Features/favourites/data/repos/favourite_repo_implementation.dart';
import 'package:bookly_app/Features/favourites/presentation/view_model/fav_cubit/favourite_cubit.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/Features/home/presentation/view_model/best_seller_cubit/best_seller_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/models/book_model/access_info.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/models/book_model/epub.dart';
import 'package:bookly_app/core/models/book_model/image_links.dart';
import 'package:bookly_app/core/models/book_model/industry_identifier.dart';
import 'package:bookly_app/core/models/book_model/panelization_summary.dart';
import 'package:bookly_app/core/models/book_model/pdf.dart';
import 'package:bookly_app/core/models/book_model/reading_modes.dart';
import 'package:bookly_app/core/models/book_model/sale_info.dart';
import 'package:bookly_app/core/models/book_model/search_info.dart';
import 'package:bookly_app/core/models/book_model/volume_info.dart';
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
  Hive.registerAdapter((AccessInfoAdapter())); //register
  Hive.registerAdapter((EpubAdapter()));
  Hive.registerAdapter((ImageLinksAdapter()));
  Hive.registerAdapter((IndustryIdentifierAdapter()));
  Hive.registerAdapter((PanelizationSummaryAdapter()));
  Hive.registerAdapter(((PdfAdapter())));
  Hive.registerAdapter((ReadingModesAdapter()));
  Hive.registerAdapter((SaleInfoAdapter()));
  Hive.registerAdapter((SearchInfoAdapter()));
  Hive.registerAdapter((VolumeInfoAdapter()));

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
        BlocProvider<FavouriteCubit>(
          create: (context) =>
              FavouriteCubit(favouriteRepo: FavouriteRepoImplementation())
                ..loadFavorites(),
        ),

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
