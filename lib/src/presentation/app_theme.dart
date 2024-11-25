import 'package:canteen_meal_report/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData getTheme() {
    String? fontFamily = GoogleFonts.inter().fontFamily;
    return ThemeData(
        fontFamily: fontFamily,
        colorScheme: ColorScheme.fromSeed(
          background: ColorName.background,
          seedColor: ColorName.primary,
          primary: ColorName.primary,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
            surfaceTintColor: Colors.white,
            showDragHandle: true,
            modalBackgroundColor: Colors.white),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: 20,
            color: ColorName.text,
            fontWeight: FontWeight.w400,
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: ColorName.text,
            fontSize: 14,
            fontFamily: fontFamily,
          ),
          headlineLarge: TextStyle(
            color: ColorName.primary,
            fontSize: 16,
            fontFamily: fontFamily,
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorName.primary),
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(
                fontSize: 14,
                fontFamily: fontFamily,
              ),
            ),
          ),
        ),
        dialogBackgroundColor: ColorName.white,
        iconTheme: const IconThemeData(color: ColorName.black),
        useMaterial3: true);
  }
}
