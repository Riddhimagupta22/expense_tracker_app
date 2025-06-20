import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ETextTheme {
  ETextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.inter(
        fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: GoogleFonts.inter(
        fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
    headlineSmall: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    titleLarge: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
    titleMedium: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
    titleSmall: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
    bodyLarge: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
    bodyMedium: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
    bodySmall: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
    labelLarge: GoogleFonts.inter(
        fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),
    labelMedium: GoogleFonts.inter(
        fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
    labelSmall: GoogleFonts.inter(
        fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.inter(
        fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: GoogleFonts.inter(
        fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
    headlineSmall: GoogleFonts.inter(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
    titleLarge: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
    titleMedium: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
    titleSmall: GoogleFonts.inter(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
    bodyLarge: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
    bodyMedium: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
    bodySmall: GoogleFonts.inter(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
    labelLarge: GoogleFonts.inter(
        fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
    labelMedium: GoogleFonts.inter(
        fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
    labelSmall: GoogleFonts.inter(
        fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
  );
}
