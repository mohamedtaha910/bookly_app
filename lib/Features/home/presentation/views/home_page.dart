import 'dart:ui';

import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/home_page_body.dart';
import 'package:bookly_app/constant.dart';
// import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 25, sigmaY: 10),
            child: AppBar(
              elevation: 0,
              // foregroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              backgroundColor: kPrimaryColor.withAlpha(200),
              title: CustomAppBar(),
              // toolbarHeight: 65,
            ),
          ),
        ),
      ),
      // backgroundColor: kPrimaryColor,
      body: SafeArea(top: false, bottom: false, child: HomePageBody()),
    );
  }
}
