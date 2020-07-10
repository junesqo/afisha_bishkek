import 'package:bishkekevents/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static TextStyle get title {
    return GoogleFonts.montserrat(
        textStyle: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 40.0));
  }

  static TextStyle get eventtitle {
    return GoogleFonts.roboto(
        textStyle: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            height: 1.0,
            fontSize: 13.0));
  }

  static TextStyle get eventnumtext {
    return GoogleFonts.roboto(
        textStyle: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            height: 1.0,
            fontSize: 12.0));
  }

  static TextStyle get subtitle {
    return GoogleFonts.roboto(
        textStyle: TextStyle(
            color: AppColors.lightgray,
            fontWeight: FontWeight.bold,
            fontSize: 12.0));
  }

  static TextStyle get navTitle {
    return GoogleFonts.montserrat(
        textStyle:
            TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold));
  }

  static TextStyle get navTitleMaterial {
    return GoogleFonts.montserrat(
        textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
  }

  static TextStyle get body {
    return GoogleFonts.roboto(
        textStyle: TextStyle(color: AppColors.darkgray, fontSize: 12.0));
  }

  static TextStyle get bodyPrimary {
    return GoogleFonts.roboto(
        textStyle: TextStyle(color: AppColors.primary, fontSize: 12.0));
  }

  static TextStyle get bodyRed {
    return GoogleFonts.roboto(
        textStyle: TextStyle(color: AppColors.red, fontSize: 12.0));
  }

  static TextStyle get picker {
    return GoogleFonts.roboto(
        textStyle: TextStyle(color: AppColors.darkgray, fontSize: 20.0));
  }

  static TextStyle get link {
    return GoogleFonts.roboto(
        textStyle: TextStyle(
            color: AppColors.black,
            fontSize: 12.0,
            fontWeight: FontWeight.bold));
  }

  static TextStyle get suggestion {
    return GoogleFonts.roboto(
        textStyle: TextStyle(color: AppColors.lightgray, fontSize: 13.0));
  }

  static TextStyle get error {
    return GoogleFonts.roboto(
        textStyle: TextStyle(color: AppColors.red, fontSize: 12.0));
  }

  static TextStyle get buttonTextLight {
    return GoogleFonts.roboto(
        textStyle: TextStyle(
            color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.bold));
  }

  static TextStyle get buttonTextDark {
    return GoogleFonts.roboto(
        textStyle: TextStyle(
            color: AppColors.darkgray,
            fontSize: 13.0,
            fontWeight: FontWeight.bold));
  }
}
