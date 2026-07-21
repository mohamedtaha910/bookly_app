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
          SvgPicture.asset(
            'assets/icons/icon.svg',
            height: 90,
            // color: Colors.pink.withAlpha(50),
            color: Colors.white38,
          ),
          SizedBox(height: 16),
          Text(
            'Search For Books Now',
            style: TextStyle(
              fontSize: 16,
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
