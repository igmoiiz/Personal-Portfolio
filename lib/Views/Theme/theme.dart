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
