import 'package:bookly_app/Features/search/presentation/view_model/search_books_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_bar.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/searched_books_list_view.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/start_search.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          // elevation: 0,
          title: Column(
            children: [
              SizedBox(height: 16),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => GoRouter.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 22,
                      color: Colors.white54,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: CustomSerchBar(
                      onChanged: (value) {
                        // if (value.isNotEmpty && value.trim() != '') {
                        BlocProvider.of<SearchBooksCubit>(
                          context,
                        ).fetchSearchedBooks(searchQuery: value);
                        // }
                      },
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 8),
            ],
          ),
        ),
        body: BlocBuilder<SearchBooksCubit, SearchBooksState>(
          builder: (context, state) {
            if (state is SearchBooksInitial) {
              return StartSearch();
            }
            if (state is SearchBooksError) {
              return CustomErrorWidget(errorMessage: state.errorMessage);
            }
            if (state is SearchBooksSuccess) {
              List<BookModel> books = state.books;
              if (books.isEmpty) {
                return const Center(
                  child: Text(
                    'No Books Found',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(height: 36),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SearchedBookListView(books: books),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is SearchBooksLoading) {
              return const CustomLoadingIndicator(
                paddingValue: 36,
                height: 25,
                width: 25,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
