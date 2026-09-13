import 'package:bookly_app/Features/home/presentation/view_model/best_seller_cubit/best_seller_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/banners_list_view.dart';
// import 'package:bookly_app/Features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/best_books_list_builder.dart';
// import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
// import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  late final ScrollController _scrollController;
  int nextPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() async {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollLenght = _scrollController.position.maxScrollExtent;
    // debugPrint('current ${currentPosition.toString()}');
    // debugPrint('max ${maxScrollLenght.toString()}');

    if (currentPosition >= (maxScrollLenght - 200)) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<BestSellerBooksCubit>(
          context,
        ).fetchBestSellerBooks(pageNum: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 88),
          // SizedBox(height: 6),
          BannersListView(),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Best Seller', style: Styles.textStyle18),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const BestBooksListBuilder(),
          ),
        ],
      ),
    );
  }
}
