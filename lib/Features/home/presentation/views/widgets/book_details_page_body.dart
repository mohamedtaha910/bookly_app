import 'package:bookly_app/Features/home/presentation/views/widgets/custom_details_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsPageBody extends StatelessWidget {
  const BookDetailsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:  16.0),
      child: Column(children: [CustomDetailsAppBar()]),
    );
  }
}

