import 'package:flutter/material.dart';

mixin AppWidget {
  static double getHeightScreen(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidthScreen(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getBottomIndicator(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static Widget divider() {
    return Container(
      width: double.infinity,
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF12B2B3).withOpacity(0.8),
            const Color(0xFF56E0E0)
          ],
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.topRight,
        ),
      ),
    );
  }

  static Widget divider2() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      height: 1,
      color: const Color.fromARGB(99, 214, 214, 214),
    );
  }
}
