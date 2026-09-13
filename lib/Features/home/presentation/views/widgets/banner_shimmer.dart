import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BannerShimmer extends StatelessWidget {
  const BannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withAlpha(50),
      // highlightColor: Colors.indigo.withAlpha(50),
      highlightColor: Colors.white24,

      child: AspectRatio(
        aspectRatio: 0.7,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.31,
          width: 130,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
