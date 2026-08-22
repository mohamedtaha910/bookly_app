import 'package:flutter/material.dart';

class NoFavourite extends StatelessWidget {
  const NoFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(28),
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
          child: Image.asset('assets/icons/no-education.png', height: 85),
        ),
        SizedBox(height: 28),
        const Center(
          child: Text(
            'No  Favourite Books yet.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
