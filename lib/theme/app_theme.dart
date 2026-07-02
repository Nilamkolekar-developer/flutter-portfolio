import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Corporate / professional palette — deep navy + slate + a single
/// confident accent blue. Kept restrained on purpose.
class AppColors {
  static const Color navy = Color(0xFF0B1F3A);
  static const Color navyLight = Color(0xFF13294B);
  static const Color slate = Color(0xFF3D4B5C);
  static const Color slateLight = Color(0xFF6B7A8F);
  static const Color accent = Color(0xFF2F6FED);
  static const Color accentDark = Color(0xFF1E4FBF);
  static const Color background = Color(0xFFF7F8FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE3E7ED);
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF5B6472);
}

class AppTheme {
  static ThemeData get theme {
    final base = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.accent,
        primary: AppColors.accent,
        background: AppColors.background,
      ),
    );

    final textTheme = GoogleFonts.interTextTheme(base.textTheme).copyWith(
      displayLarge: GoogleFonts.poppins(
        fontSize: 56,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.1,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.15,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.6,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.6,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.surface,
      ),
    );

    return base.copyWith(textTheme: textTheme);
  }
}
