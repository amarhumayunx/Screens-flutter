import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryLight = Color(0xFF9D97FF);
  static const Color primaryDark = Color(0xFF4A44CC);

  // Background Colors
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Colors.white;
  static const Color surfaceVariant = Color(0xFFF1F3F4);

  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);

  // Single Card Background Colors
  static const Color singleGreen = Color(0xFF7ED321);
  static const Color singleBlue = Color(0xFF2E3A59);
  static const Color singlePink = Color(0xFFE91E63);
  static const Color singlePurple = Color(0xFF9C27B0);
  static const Color singleOrange = Color(0xFFFF9800);
  static const Color singleTeal = Color(0xFF00BCD4);

  // System Colors
  static const Color error = Color(0xFFDC3545);
  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF17A2B8);

  static List<Color> get singleBackgrounds => [
    singleGreen,
    singleBlue,
    singlePink,
    singlePurple,
    singleOrange,
    singleTeal,
  ];
}