import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme {
  static final TextTheme primary = TextTheme(
    headline1: GoogleFonts.poppins(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
    headline2: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
    headline4: GoogleFonts.poppins(
      fontSize: 8.0,
      fontWeight: FontWeight.normal,
    ),
    headline5: GoogleFonts.poppins(
      fontSize: 13.0,
      fontWeight: FontWeight.w900,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
    ),
    bodyText2: GoogleFonts.poppins(
      fontSize: 11.0,
      fontWeight: FontWeight.normal,
    ),
    button: GoogleFonts.poppins(
      fontSize: 16.0,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: 16.0,
      color: Colors.grey,
      fontWeight: FontWeight.normal,
    ),
  );

  static final TextTheme secondary = TextTheme(
    headline1: GoogleFonts.poppins(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,

    ),
    button: GoogleFonts.poppins(
      fontSize: 14.0,

      fontWeight: FontWeight.bold,
    ),
  );
}
