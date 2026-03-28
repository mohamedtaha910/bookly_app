import 'package:bookly_app/Features/home/presentation/views/widgets/Banner_item.dart';
import 'package:flutter/material.dart';

class BannersListView extends StatelessWidget {
  const BannersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          ...List.generate(10, (index) {
            return BannerItem();
          }),
        ],
      ),
    );
  }
}
