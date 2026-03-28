import 'package:bookly_app/Features/home/presentation/views/home_page.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:get/get_connect/http/src/utils/utils.dart';
// // import 'package:get/get_connect/http/src/utils/utils.dart';

class SplashPageBody extends StatefulWidget {
  const SplashPageBody({super.key});

  @override
  State<SplashPageBody> createState() => _SplashPageBodyState();
}

// class _SplashPageBodyState extends State<SplashPageBody>
//     with SingleTickerProviderStateMixin {
//   late AnimationController animationController;
//   late Animation<Offset> slidingAnimation;

//   @override
//   void initState() {

//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );

//     slidingAnimation = Tween<Offset>(
//       begin: const Offset(0, 4),
//       end: Offset.zero,
//     ).animate(animationController);

//     slidingAnimation.addListener(() {
//       setState(() {});
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         // Spacer(),
//         Row(
//           children: [
//             Spacer(),
//             SvgPicture.asset(
//               AssetsPath.books,
//               height: 70,

//               // color: const Color.fromARGB(255, 57, 4, 99),
//               // color: Colors.deepPurple.shade300,
//             ),
//             SizedBox(width: 16),
//             Image.asset(AssetsPath.logo, width: 210),
//             Spacer(),
//           ],
//         ),
//         SizedBox(height: 8),
//         AnimatedBuilder(
//           animation: slidingAnimation,
//           builder:(context, _) =>
//            SlideTransition(
//             position: slidingAnimation,

//             child: Text(
//               '    Read Free Books',
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontStyle: FontStyle.italic,
//                 color: const Color.fromARGB(255, 228, 200, 251),
//               ),
//             ),
//           ),
//         ),
//         // Spacer(),
//       ],
//     );
//   }
// }

// ========================================
class _SplashPageBodyState extends State<SplashPageBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    initSlidingAnimation();
    
    navigateToHome();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetsPath.logo, width: 250),

        SizedBox(height: 24),

        AnimatedBuilder(
          animation: animationController,
          builder: (context, _) => FadeTransition(
            opacity: fadeAnimation,
            child: SlideTransition(
              position: slidingAnimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    // AssetsPath.books2,
                    AssetsPath.bookOpen,
                    height: 20,
                    // height: 130,
                    color: kSecondaryColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Read Free Books',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      color: kSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOutBack, //
          ),
        );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.to(
        () => HomePage(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 250),
      );
    });
  }

}
