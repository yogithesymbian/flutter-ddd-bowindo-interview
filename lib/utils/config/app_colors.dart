import 'package:flutter/material.dart';

// Color converter: https://www.w3schools.com/colors/colors_converter.asp
// Transparency list
// 100% FF
// 95%  F2
// 90%  E6
// 87%  DE
// 85%  D9
// 80%  CC
// 75%  BF
// 70%  B3
// 65%  A6
// 60%  99
// 55%  8C
// 54%  8A
// 50%  80
// 45%  73
// 40%  66
// 35%  59
// 32%  52
// 30%  4D
// 26%  42
// 25%  40
// 20%  33
// 16%  29
// 15%  26
// 12%  1F
// 10%  1A
// 5%   0D

class AppColors {
  const AppColors({
    required this.background,
    required this.backgroundDark,
    required this.primary,
    required this.primaryDark,
    required this.secondaryDark1,
    required this.secondaryDark2,
    required this.secondary1,
    required this.secondary2,
    required this.secondary3,
    required this.secondary4,
    required this.outline,
  });

  factory AppColors.light() {
    return const AppColors(
      background: Color(0xffF8FAFB),
      backgroundDark: Color(0xFFF2F4F6),
      primary: Color(0xFF4D7CFE),
      primaryDark: Color(0xff252631),
      secondaryDark1: Color(0xff778CA2),
      secondaryDark2: Color(0xff98A9BC),
      secondary1: Color(0xffFFAB2B),
      secondary2: Color(0xff6DD230),
      secondary3: Color(0xffFE4D97),
      secondary4: Color(0xff2CE5F6),
      outline: Color(0xffE8ECEF),
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      background: Color(0xff121212),
      backgroundDark: Color(0xff121212),
      primary: Color(0xff121212),
      primaryDark: Color(0xff121212),
      secondaryDark1: Color(0xff121212),
      secondaryDark2: Color(0xff121212),
      secondary1: Color(0xff121212),
      secondary2: Color(0xff121212),
      secondary3: Color(0xff121212),
      secondary4: Color(0xff121212),
      outline: Color(0xff121212),
    );
  }

  final Color background;
  final Color backgroundDark;
  final Color primary;
  final Color primaryDark;
  final Color secondaryDark1;
  final Color secondaryDark2;
  final Color secondary1;
  final Color secondary2;
  final Color secondary3;
  final Color secondary4;
  final Color outline;
}
