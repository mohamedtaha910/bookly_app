import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';

class SimiliarBookItem extends StatelessWidget {
  const SimiliarBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.19,
      child: AspectRatio(
        aspectRatio: 0.74,
        child: Container(
          margin: EdgeInsetsDirectional.only(end: 12),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.white10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/photo/cover3.webp'),
            ),
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: kShadowColor,
                offset: Offset(0, 1),
                blurRadius: 4,
              ),
            ]
            

          ),
        ),
      ),
    );
  }
}