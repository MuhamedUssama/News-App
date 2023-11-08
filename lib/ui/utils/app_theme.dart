import 'package:flutter/material.dart';
import 'package:news_app/ui/utils/app_colors.dart';

abstract class AppTheme {
  static const TextStyle appBarAndCategoriesTitle = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w400, color: AppColors.white);

  static const TextStyle sourcesTab = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.white);

  static const TextStyle articalText = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.textColor);

  static const TextStyle sourcesUnderArticle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.sourcesUnderArticle);

  static const TextStyle timeText = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.timeColor);

  static const TextStyle drawerText = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.importantText);

  static const TextStyle settingLanguageText = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.importantText);

  static const TextStyle searchText = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.primary);

  static const TextStyle articleDescriptionText = TextStyle(
      fontSize: 13, fontWeight: FontWeight.w300, color: AppColors.textColor);

  static const TextStyle errorText = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.textColor);
}
