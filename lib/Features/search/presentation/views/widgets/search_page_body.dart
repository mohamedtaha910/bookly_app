import 'dart:ui';

import 'package:bookly_app/Features/search/presentation/view_model/search_books_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_bar.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/searched_books_list_view.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/start_search.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key, required this.isBack});
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 65,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          // elevation: 0,
          title: Column(
            children: [
              // SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isBack
                      ? GestureDetector(
                          onTap: () => GoRouter.of(context).pop(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                              child: Container(
                                padding: EdgeInsets.all(4.8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  // color: Colors.white10,
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white.withAlpha(60),
                                      Colors.white.withAlpha(40),
                                      Colors.white.withAlpha(10),
                                    ],
                                    begin: AlignmentGeometry.topCenter,
                                    end: AlignmentGeometry.bottomCenter,
                                  ),
                                  border: Border(
                                    top: BorderSide(
                                      color: Colors.grey.withAlpha(120),
                                      width: 0.95,
                                    ),
                                  ),
                                ),
                                child: Icon(
                                  Icons.chevron_left_rounded,
                                  size: 32,
                                  color: Colors.white54,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  isBack ? SizedBox(width: 12) : SizedBox.shrink(),
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
        body: Stack(
          children: [
            BlocBuilder<SearchBooksCubit, SearchBooksState>(
              builder: (context, state) {
                if (state is SearchBooksInitial) {
                  return StartSearch();
                }
                if (state is SearchBooksError) {
                  return CustomErrorWidget(
                    errorMessage: state.errorMessage,
                    iconSize: 60,
                  );
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(height: 36),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
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

            // shadow
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      kPrimaryColor,
                      kPrimaryColor.withAlpha(200),
                      kPrimaryColor.withAlpha(100),
                      kPrimaryColor.withAlpha(10),
                      kPrimaryColor.withAlpha(0),
                    ],
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
