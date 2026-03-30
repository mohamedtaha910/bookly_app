// import 'package:flutter/material.dart';

// class BannerItem extends StatelessWidget {
//   const BannerItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.31,
//       child: AspectRatio(
//         aspectRatio: 0.7,
//         child: Container(
//           margin: EdgeInsetsDirectional.only(end: 16),
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               fit: BoxFit.fill,
//               image: AssetImage('assets/photo/cover3.webp'),
//             ),
//             borderRadius: BorderRadius.circular(16),
//           ),
//         ),
//       ),
//     );
//   }
// }
// ============================================
import 'package:flutter/material.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/photo/cover3.webp'),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}