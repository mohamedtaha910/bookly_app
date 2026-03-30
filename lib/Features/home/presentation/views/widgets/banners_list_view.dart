import 'package:bookly_app/Features/home/presentation/views/widgets/Banner_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannersListView extends StatelessWidget {
  const BannersListView({super.key});

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   physics: const BouncingScrollPhysics(),
    //   child: Row(
    //     children: [
    //       ...List.generate(20, (index) {
    //         return BannerItem();
    //       }),
    //     ],
    //   ),
    // );

    //======================================================
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          // aspectRatio: 1.7,
          viewportFraction: 0.5,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(seconds: 3),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          disableCenter: true,
        ),
        itemCount: 15,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            BannerItem(),
      ),
    );
  }
}
