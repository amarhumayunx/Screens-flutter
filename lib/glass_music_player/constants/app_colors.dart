import 'package:flutter/material.dart';

class AppColors {
  // Gradient colors
  static const Color gradientStart = Color(0xFF8B7ED8);
  static const Color gradientMiddle = Color(0xFFE291AA);
  static const Color gradientEnd = Color(0xFF9B59B6);

  // Collection card colors
  static const Color chilloutColor = Color(0xFFE291AA);
  static const Color workColor = Color(0xFF2C3E50);
  static const Color spiritualColor = Color(0xFF3498DB);

  // Text colors
  static const Color primaryText = Colors.white;
  static Color secondaryText = Colors.white.withOpacity(0.7);

  // Button colors
  static Color buttonBackground = Colors.white.withOpacity(0.3);
  static Color playerBackground = Colors.black.withOpacity(0.8);
  static const Color playButtonColor = Colors.red;

  // Utility methods
  static LinearGradient get mainGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      gradientStart,
      gradientMiddle,
      gradientEnd,
    ],
  );

  static BoxShadow get cardShadow => BoxShadow(
    color: Colors.black.withOpacity(0.1),
    blurRadius: 10,
    offset: Offset(0, 5),
  );

  static BoxShadow get playerShadow => BoxShadow(
    color: Colors.black.withOpacity(0.2),
    blurRadius: 15,
    offset: Offset(0, 5),
  );
}