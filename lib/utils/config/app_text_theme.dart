import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  const AppTextTheme._({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.h5,
    required this.caption,
    required this.button,
    required this.text,
    required this.textSecondary,
    required this.link,
  });

  factory AppTextTheme() {
    // const _normalRegular = TextStyle(
    //   fontWeight: FontWeight.w400,
    //   height: 1.5,
    //   leadingDistribution: TextLeadingDistribution.even,
    // );
    return AppTextTheme._(
      h1: GoogleFonts.rubik(
        fontSize: 30,
        fontWeight: FontWeight.normal,
      ),
      h2: GoogleFonts.rubik(
        fontSize: 26,
        fontWeight: FontWeight.normal,
      ),
      h3: GoogleFonts.rubik(
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      h4: GoogleFonts.rubik(
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      h5: GoogleFonts.rubik(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      caption: GoogleFonts.rubik(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      button: GoogleFonts.rubik(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      text: GoogleFonts.rubik(
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
      textSecondary: GoogleFonts.rubik(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      link: GoogleFonts.rubik(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    );
  }
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle h5;
  final TextStyle caption;
  final TextStyle button;
  final TextStyle text;
  final TextStyle textSecondary;
  final TextStyle link;
}

// extension TextStyleExt on TextStyle {
//   TextStyle bold() => copyWith(fontWeight: FontWeight.w700);
//
//   TextStyle comfort() => copyWith(height: 1.8);
//
//   TextStyle dense() => copyWith(height: 1.2);
//
//   // TextStyle rotunda() => copyWith(fontFamily: FontFamily.rotunda);
// }
