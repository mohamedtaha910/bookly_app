import 'package:bookly_app/Features/home/presentation/views/widgets/books_list_view.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        // elevation: 0,
        title: Column(
          children: [
            SizedBox(height: 8),
            Row(
              children: [
                GestureDetector(
                  onTap: () => GoRouter.of(context).pop(),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 22,
                    color: Colors.white54,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(child: CustomSerchBar()),
              ],
            ),
            // SizedBox(height: 8),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              
              SizedBox(height: 36),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: BooksListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
