import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSerchBar extends StatelessWidget {
  const CustomSerchBar({super.key, this.onChanged});
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.pink.withAlpha(20),
        // fillColor: Colors.white10,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: SvgPicture.asset(
            AssetsPath.serach,
            height: 22,
            color: Colors.white54,
          ),
        ),
        suffixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Icon(Icons.mic, size: 24, color: Colors.white54),
        ),
        hintText: 'Search ',
        hintStyle: Styles.textStyle16.copyWith(color: Colors.white54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.white54, width: 0.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.white54, width: 0.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.white54, width: 0.4),
        ),
      ),
    );
  }
}
