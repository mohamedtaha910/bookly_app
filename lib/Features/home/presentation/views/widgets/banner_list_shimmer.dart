import 'package:bookly_app/Features/home/presentation/views/widgets/banner_shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerListShimmer extends StatelessWidget {
  const BannerListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.28,
      width: double.infinity,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          // aspectRatio: 1.7,
          viewportFraction: 0.44,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(seconds: 3),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          disableCenter: true,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            BannerShimmer(),
      ),
    );
  }
}
