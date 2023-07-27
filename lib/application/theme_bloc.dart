import 'package:flutter_wonderwoman_projectscoid/utils/config/app_colors.dart';
import 'package:flutter_wonderwoman_projectscoid/utils/config/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeState {
  ThemeState({
    required this.mode,
    required this.data,
    required this.textTheme,
    required this.appColors,
  });

  factory ThemeState.light() {
    const mode = ThemeMode.light;
    final appColors = AppColors.light();
    final textTheme = AppTextTheme();
    final themeData = ThemeData.light().copyWith(
        useMaterial3: true,
        primaryColor: appColors.primary,
        scaffoldBackgroundColor: appColors.background,
        backgroundColor: appColors.background,
        textTheme: GoogleFonts.rubikTextTheme(ThemeData.light().textTheme),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: appColors.secondary1,
          behavior: SnackBarBehavior.floating,
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        toggleableActiveColor: appColors.primary,
        unselectedWidgetColor: appColors.outline,
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 16,
          shadowColor: const Color(0x40999BA8).withOpacity(0.25),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.white,
            textStyle: textTheme.button,
            minimumSize: const Size.fromHeight(46),
            backgroundColor: appColors.primary,
          ).copyWith(
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              return Colors.white;
            }),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return appColors.primary.withOpacity(0.5);
              }
              return appColors.primary;
            }),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          // contentPadding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
          isDense: true,
          labelStyle: textTheme.caption
              .merge(TextStyle(color: appColors.secondaryDark2)),
          floatingLabelStyle:
              textTheme.caption.merge(TextStyle(color: appColors.primary)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: appColors.backgroundDark,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: appColors.primary,
            ),
          ),
        ));

    return ThemeState(
      mode: mode,
      data: themeData,
      textTheme: AppTextTheme(),
      appColors: appColors,
    );
  }

  factory ThemeState.dark() {
    const mode = ThemeMode.dark;
    final appColors = AppColors.dark();
    final themeData = ThemeData.dark().copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: appColors.background,
      backgroundColor: appColors.background,
      textTheme: GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: appColors.secondary1,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return ThemeState(
      mode: mode,
      data: themeData,
      textTheme: AppTextTheme(),
      appColors: appColors,
    );
  }

  final ThemeMode mode;
  final ThemeData data;
  final AppTextTheme textTheme;
  final AppColors appColors;
}

final themeBlocProvider = StateNotifierProvider<ThemeBloc, ThemeState>(
  (ref) => ThemeBloc(),
);

class ThemeBloc extends StateNotifier<ThemeState> {
  ThemeBloc() : super(ThemeState.light());
}
