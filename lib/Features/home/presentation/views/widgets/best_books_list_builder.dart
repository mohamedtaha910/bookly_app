import 'package:bookly_app/Features/home/presentation/view_model/best_seller_cubit/best_seller_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list.dart';
// import 'package:bookly_app/Features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/widgets/book_shimmer.dart';
import 'package:bookly_app/core/widgets/books_shimmer_list.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
// import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestBooksListBuilder extends StatelessWidget {
  const BestBooksListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerBooksCubit, BestSellerBooksState>(
      builder: (context, state) {
        if (state is BestSellerBooksError) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
            iconSize: 50,
          );
        }
        if (state is BestSellerBooksSuccess) {
          List<BookModel> books = state.books;
          return BestSellerList(books: books);
        } else {
          return BooksShimmerList();
        }
      },
    );
  }
}
