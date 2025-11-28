import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  const AppTypography._();

  static TextTheme get textTheme => GoogleFonts.robotoTextTheme();

  static TextStyle get displayLarge => GoogleFonts.oswald(
    fontSize: 80,
    fontWeight: FontWeight.bold,
    height: 1.0,
  );

  static TextStyle get displayMedium => GoogleFonts.oswald(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    height: 1.0,
  );

  static TextStyle get sectionTitle =>
      GoogleFonts.oswald(fontSize: 48, fontWeight: FontWeight.bold);

  static TextStyle get cardTitle =>
      GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold);

  static TextStyle get cardSubtitle =>
      GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle get bodyLarge => GoogleFonts.roboto(fontSize: 18);

  static TextStyle get bodyMedium => GoogleFonts.roboto(fontSize: 16);

  static TextStyle get bodySmall =>
      GoogleFonts.roboto(fontSize: 14, height: 1.5);

  static TextStyle get monospace => GoogleFonts.robotoMono(fontSize: 20);

  static TextStyle get monospaceSmall => GoogleFonts.robotoMono(fontSize: 14);

  static TextStyle get iconLarge => const TextStyle(fontSize: 24);

  static TextStyle get iconMedium => const TextStyle(fontSize: 20);

  static TextStyle get iconSmall => const TextStyle(fontSize: 16);

  static TextStyle get tag => const TextStyle(fontSize: 12);

  static TextStyle get labelLarge =>
      GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500);
}
