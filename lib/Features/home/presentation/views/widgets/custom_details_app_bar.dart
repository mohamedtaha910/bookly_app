import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDetailsAppBar extends StatelessWidget {
  const CustomDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:  24.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink.withAlpha(25),
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
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink.withAlpha(25),
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
              )
            ),
          ),
        ],
      ),
    );
  }
}
