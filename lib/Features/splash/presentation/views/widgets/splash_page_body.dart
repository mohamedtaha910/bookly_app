import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPageBody extends StatelessWidget {
  const SplashPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Spacer(),
        Row(
          children: [
            Spacer(),
            SvgPicture.asset(
              AssetsPath.books,
              height: 50,
              color: const Color.fromARGB(255, 71, 6, 122),
            ),
            SizedBox(width: 16),
            Image.asset(AssetsPath.logo, height: 200, width: 200),
            Spacer(),
          ],
        ),
        // Spacer(),
      ],
    );
  }
}
