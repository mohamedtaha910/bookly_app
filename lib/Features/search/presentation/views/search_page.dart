import 'package:bookly_app/Features/search/presentation/views/widgets/search_page_body.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key, required this.isBack});
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SearchPageBody(
        isBack: isBack,
      ),
    ) ;
  }
}