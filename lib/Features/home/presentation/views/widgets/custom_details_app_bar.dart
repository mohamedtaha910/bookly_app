import 'package:bookly_app/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDetailsAppBar extends StatelessWidget {
  const CustomDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.pink.withAlpha(50),
                    Colors.pink.withAlpha(30),
                    Colors.pink.withAlpha(20),
                  ],
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                ),

                borderRadius: BorderRadius.circular(100),
                border: Border(
                  top: BorderSide(
                    color: Colors.pink.withAlpha(100),
                    width: 0.8,
                  ),
                ),
              ),
              child: Icon(
                Icons.close,
                // size: 20,
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.pink.withAlpha(50),
                    Colors.pink.withAlpha(30),
                    Colors.pink.withAlpha(20),
                  ],
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                ),

                borderRadius: BorderRadius.circular(100),
                border: Border(
                  top: BorderSide(
                    color: Colors.pink.withAlpha(100),
                    width: 0.8,
                  ),
                ),
              ),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.bookmark_add_rounded, color: kSecondaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
