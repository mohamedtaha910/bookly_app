import 'dart:ui';

import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsPath.logo,
            //  width: 100,
            height: 28,
            // height: 20,
          ),

          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kSearchPage);
            },
            child: Container(
              padding: const EdgeInsets.only(
                right: 10,
                left: 10,
                top: 10,
                bottom: 10,
              ),
              // padding: EdgeInsets.all(8),
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
              child: SvgPicture.asset(AssetsPath.serach, height: 26),
            ),
          ),
        ],
      ),
    );
  }
}
