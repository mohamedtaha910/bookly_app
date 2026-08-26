// import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textStyle20 =  TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    // color: kSecondaryColor
    
  );

  static TextStyle textStyle30 = GoogleFonts.playfairDisplay(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
}
