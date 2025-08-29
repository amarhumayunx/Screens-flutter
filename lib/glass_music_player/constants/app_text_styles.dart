import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Headers
  static const TextStyle sectionHeader = TextStyle(
    color: AppColors.primaryText,
    fontSize: 28,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle subSectionHeader = TextStyle(
    color: AppColors.primaryText,
    fontSize: 22,
    fontWeight: FontWeight.w300,
  );

  // Collection card styles
  static const TextStyle collectionTitle = TextStyle(
    color: AppColors.primaryText,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle collectionSubtitle = TextStyle(
    color: AppColors.secondaryText,
    fontSize: 12,
  );

  // Song list styles
  static const TextStyle songTitle = TextStyle(
    color: AppColors.primaryText,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle songArtist = TextStyle(
    color: AppColors.secondaryText,
    fontSize: 14,
  );

  // Player styles
  static const TextStyle playerSongTitle = TextStyle(
    color: AppColors.primaryText,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle playerArtist = TextStyle(
    color: AppColors.secondaryText,
    fontSize: 14,
  );
}