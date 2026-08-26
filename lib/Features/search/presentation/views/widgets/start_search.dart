import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StartSearch extends StatelessWidget {
  const StartSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(28),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(300),
              shape: BoxShape.circle,
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
                top: BorderSide(color: Colors.grey.withAlpha(120), width: 1.4),
              ),
            ),
            child: Image.asset('assets/icons/search.png', height: 75),
          ),
          SizedBox(height: 24),
          Text(
            'Search For Books Now.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white54,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
