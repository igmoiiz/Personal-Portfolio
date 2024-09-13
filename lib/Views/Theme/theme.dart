import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkMode = ThemeData(
  fontFamily: GoogleFonts.outfit().fontFamily,
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    surface: Color(0xFF040D12), // ! background
    primary: Color(0xFF5C8374), // ! buttons
    tertiary: Color(0xFFECDFCC), // ! text
    onPrimary: Color(0xFF183D3D), // ! contrast
  ),
);
ThemeData lightMode = ThemeData(
  fontFamily: GoogleFonts.outfit().fontFamily,
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    surface: Color.fromARGB(255, 32, 32, 32), // ! background
    primary: Color.fromARGB(255, 59, 59, 59), // ! buttons
    secondary: Color(0xFF7d7d7d), // ! other
    tertiary: Color(0xFFECDFCC), // ! text
    onPrimary: Color(0xFF150f38), // ! contrast
    inversePrimary: Color(0xFF040622),
    inverseSurface: Color(0xFF1c1d54),
  ),
);
