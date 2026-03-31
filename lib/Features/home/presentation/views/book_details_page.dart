import 'package:bookly_app/Features/home/presentation/views/widgets/book_details_page_body.dart';
import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookDetailsPageBody(),
    );
  }
}