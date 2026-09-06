import 'dart:ui';

import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CustomSerchBar extends StatelessWidget {
  const CustomSerchBar({super.key, this.onChanged});
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            // color: Colors.white10,
            gradient: LinearGradient(
              colors: [
                Colors.white.withAlpha(40),
                Colors.white.withAlpha(30),
                Colors.white.withAlpha(20),
              ],
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
            ),
            border: Border(
              top: BorderSide(color: Colors.grey.withAlpha(120), width: 0.95),
            ),
          ),
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              // filled: true,
              // fillColor: Colors.pink.withAlpha(20),
              // fillColor: Colors.white10,
              // fillColor: Colors.black26,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                child: Icon(
                  Iconsax.search_normal_copy,
                  size: 24,
                  color: Colors.white54,
                ),
              ),
              suffixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                child: Icon(Icons.mic, size: 24, color: Colors.white54),
              ),
              hintText: 'Search ',
              hintStyle: Styles.textStyle16.copyWith(color: Colors.white54),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.white54, width: 0.05),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.white54, width: 0.05),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.white54, width: 0.05),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
