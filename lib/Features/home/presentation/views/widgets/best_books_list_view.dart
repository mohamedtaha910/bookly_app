import 'package:bookly_app/Features/home/presentation/view_model/best_seller_cubit/best_seller_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestBooksListView extends StatelessWidget {
  const BestBooksListView({super.key});

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
          return ListView.builder(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: books.length,
            itemBuilder: (context, index) => Column(
              children: [
                BookItem(bookModel: books[index]),
                SizedBox(height: 24),
                index == books.length - 1
                    ? const SizedBox(height: 65)
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 42),
                        width: double.infinity,
                        height: 1,
                        color: Colors.white10,
                      ),
                SizedBox(height: 24),
              ],
            ),
          );
        } else {
          return CustomLoadingIndicator(
            paddingValue: 48,
            height: 25,
            width: 25,
          );
        }
      },
    );
  }
}
