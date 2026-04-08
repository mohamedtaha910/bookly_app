import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key, required this.paddingValue, required this.height, required this.width});
  final double paddingValue;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
            child: Padding(
              padding: EdgeInsets.all(paddingValue),
              child: SizedBox(
                height:  height,
                width: width,
                child: CircularProgressIndicator(
                  // padding: EdgeInsets.all(36),
                ),
              ),
            ),
          );
  }
}