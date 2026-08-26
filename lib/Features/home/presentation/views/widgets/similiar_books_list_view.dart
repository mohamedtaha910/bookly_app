import 'package:bookly_app/Features/home/presentation/view_model/similar_books_cubit/similar_book_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/similiar_book_item.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimiliarbooksListView extends StatelessWidget {
  const SimiliarbooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookCubit, SimilarBookState>(
      builder: (context, state) {
        if (state is SimilarBookError) {
          return CustomErrorWidget(errorMessage: state.message, iconSize: 38);
        }
        if (state is SimilarBookSuccess) {
          List<BookModel> books = state.books;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                ...List.generate(books.length, (index) {
                  return SimiliarBookItem(book: books[index]);
                }),
              ],
            ),
          );
        }
        return const CustomLoadingIndicator(
          paddingValue: 36,
          height: 25,
          width: 25,
        );
      },
    );
  }
}
