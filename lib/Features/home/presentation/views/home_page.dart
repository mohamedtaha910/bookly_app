import 'dart:ui';

import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/home_page_body.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/shadow.dart';
import 'package:bookly_app/constant.dart';
// import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      // backgroundColor: kPrimaryColor,
      body: SafeArea(
        // top: false,
        bottom: false,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            HomePageBody(),
            // shadow
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      kPrimaryColor,
                      kPrimaryColor.withAlpha(210),
                      kPrimaryColor.withAlpha(120),
                      kPrimaryColor.withAlpha(10),
                      kPrimaryColor.withAlpha(0),
                      // Colors.red,
                    ],
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                  ),
                ),
              ),
            ),

            Positioned(top: 8, right: 16, left: 16, child: CustomAppBar()),
          ],
        ),
      ),
    );
  }
}
