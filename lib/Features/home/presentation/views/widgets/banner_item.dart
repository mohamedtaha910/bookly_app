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
import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(end: 16),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              // image: AssetImage('assets/photo/cover3.webp'),
              image: NetworkImage(bookModel.volumeInfo.imageLinks!.thumbnail!),
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: kShadowColor,
                // color: Colors.red,
                offset: Offset(2, 2),
                blurRadius: 4,
              ),
            ]
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
                Text(
                  '8.4',
                  style: const TextStyle(
                    color: Colors.white,
                    // fontSize: 20,
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
    );
  }
}
