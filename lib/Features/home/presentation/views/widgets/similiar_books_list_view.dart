import 'package:bookly_app/Features/home/presentation/views/widgets/similiar_book_item.dart';
import 'package:flutter/material.dart';

class SimiliarbooksListView extends StatelessWidget {
  const SimiliarbooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          ...List.generate(20, (index) {
            return SimiliarBookItem();
          }),
        ],
      ),
    );
  }
}