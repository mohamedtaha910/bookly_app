import 'package:bookly_app/Features/home/presentation/view_model/best_seller_cubit/best_seller_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/best_books_list.dart';
// import 'package:bookly_app/core/widgets/books_list.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/widgets/book_shimmer.dart';
import 'package:bookly_app/core/widgets/books_shimmer_list.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
// import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestBooksListBuilder extends StatefulWidget {
  const BestBooksListBuilder({super.key});

  @override
  State<BestBooksListBuilder> createState() => _BestBooksListBuilderState();
}

class _BestBooksListBuilderState extends State<BestBooksListBuilder> {
  @override
  Widget build(BuildContext context) {
    List<BookModel> books = BlocProvider.of<BestSellerBooksCubit>(
      context,
    ).books;

    return BlocBuilder<BestSellerBooksCubit, BestSellerBooksState>(
      // listener: (context, state) {
      //   if (state is BestSellerBooksSuccess) {
      //     // books.addAll(state.books);
      //   }
      //   if (state is BestSellerBooksPaginationFailure) {
      //     // buildErrorSnackBar(context, state.errorMessage);
      //   }
      // },
      builder: (context, state) {
        // List<BookModel> books =
        if (state is BestSellerBooksError) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
            iconSize: 50,
          );
        }
        if (state is BestSellerBooksPaginationLoading) {
          return Column(
            children: [
              BestBooksList(books: state.prevBooks, endSpace: 0),
              // CustomLoadingIndicator(paddingValue: 0, height: 16, width: 16),
              BookShimmer(),
            ],
          );
        }
        if (state is BestSellerBooksSuccess ||
            state is BestSellerBooksPaginationFailure) {
          if (books.isEmpty) {
            return Center(child: Text('ddddddd'));
          }
          //  books.addAll(state.books);
          return BestBooksList(books: books);
        } else {
          return BooksShimmerList();
        }
      },
    );
  }

  void buildErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,

        content: Text(
          message,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        duration: Duration(seconds: 4),
      ),
    );
  }
}
