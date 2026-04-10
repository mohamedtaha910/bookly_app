import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';

class CustomBookCover extends StatelessWidget {
  const CustomBookCover({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.33,
      child: AspectRatio(
        aspectRatio: 0.73,
        child: Container(
          margin: EdgeInsetsDirectional.only(end: 16),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              // image: AssetImage('assets/photo/cover3.webp'),
              image: NetworkImage(
                imageUrl,
                
              ),
            ),
            border: Border.all(width: 2, color: Colors.white10),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: kShadowColor,
                offset: Offset(0, 1),
                blurRadius: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
