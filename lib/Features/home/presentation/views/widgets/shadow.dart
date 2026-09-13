import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';

class CustomShadow extends StatelessWidget {
  const CustomShadow({this.height = 45, super.key});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      // height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kPrimaryColor,
            kPrimaryColor.withAlpha(200),
            kPrimaryColor.withAlpha(100),
            kPrimaryColor.withAlpha(10),
            kPrimaryColor.withAlpha(0),
          ],
          end: AlignmentGeometry.topCenter,
          begin: AlignmentGeometry.bottomCenter,
        ),
      ),
    );
  }
}
