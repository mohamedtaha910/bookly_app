import 'dart:ui';

import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 15),
        child: Container(
          padding: EdgeInsets.only(top: 6, bottom: 6, left: 20, right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            // color: Colors.white10,
            gradient: LinearGradient(
              colors: [
                Colors.white.withAlpha(20),
                Colors.white.withAlpha(15),
                Colors.white.withAlpha(10),
                // kPrimaryColor.withAlpha(100),
                // kPrimaryColor.withAlpha(15),
                // kPrimaryColor.withAlpha(10),
              ],
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
            ),
            border: Border(
              top: BorderSide(color: Colors.grey.withAlpha(16), width: 1.3),
              bottom: BorderSide(color: Colors.grey.withAlpha(16), width: 1.3),
            ),
          ),
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
                  child: Icon(Iconsax.search_normal_copy, size: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
