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
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
// import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';
class BannerItem extends StatelessWidget {
  const BannerItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    String rating = (Random().nextDouble() * 10).toStringAsFixed(1);
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.kBoookDetails , extra: bookModel), 
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 0.7,
              child: CachedNetworkImage(
                height:  MediaQuery.of(context).size.height * 0.31,
                width: 130,
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 22,
            child: Container(
              // margin: EdgeInsetsDirectional.only(end: 16),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text
                    ( rating,
                      // Random().nextInt(10).toString(),
                    // Random.secure().nextInt(10).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
