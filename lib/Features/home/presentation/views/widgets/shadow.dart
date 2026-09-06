import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';

class CustomShadow extends StatelessWidget {
  const CustomShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Container(
              height: 45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    kPrimaryColor,
                    kPrimaryColor.withAlpha(50),
                    kPrimaryColor.withAlpha(10),

                    // Colors.transparent
                  ],
                ),
              ),
            ),
          );
  }
}