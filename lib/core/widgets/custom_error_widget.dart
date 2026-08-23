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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              // color: Colors.white10,
              gradient: LinearGradient(
                colors: [
                  Colors.pink.withAlpha(80),
                  Colors.pink.withAlpha(40),
                  Colors.pink.withAlpha(20),
                ],
                begin: AlignmentGeometry.topCenter,
                end: AlignmentGeometry.bottomCenter,
              ),
              border: Border(
                top: BorderSide(color: Colors.pink.withAlpha(120), width: 0.8),
              ),
            ),
            child: Icon(
              Icons.error_outline_rounded,
              size: iconSize,
              color: Colors.grey.shade400,
            ),
          ),
          SizedBox(height: 28),
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
      ),
    );
  }
}
