import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
    this.iconSize = 75,
  });
  final String errorMessage;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Container(
          padding: EdgeInsets.all(16),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            // color: Colors.white10,
            gradient: LinearGradient(
              colors: [
                Colors.white.withAlpha(60),
                Colors.white.withAlpha(40),
                Colors.white.withAlpha(10),
              ],
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
            ),
            border: Border(
              top: BorderSide(color: Colors.grey.withAlpha(120), width: 0.95),
            ),
          ),
          child: Image.asset('assets/icons/error.png', height: iconSize),
        ),
        SizedBox(height: 24),
        Center(
          child: Text(
            errorMessage,
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
