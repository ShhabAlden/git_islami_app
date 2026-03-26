import 'package:flutter/material.dart';
import 'package:islami_app/UI/utils/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.Golden,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.black,
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
  );
}
