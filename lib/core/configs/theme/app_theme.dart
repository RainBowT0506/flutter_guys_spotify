import 'package:flutter/material.dart';
import 'package:flutter_guys_spotify/core/configs/theme/app_colors.dart';

/// 定義應用程式的主題，包含光亮和暗色模式的設定，
/// 統一管理樣式，如顏色、按鈕和文字樣式。
/// - 主要顏色：`primaryColor`
/// - 背景顏色：`scaffoldBackgroundColor`
/// - 亮度模式：`brightness`
/// - 文字字型：`fontFamily: 'Satoshi'`
/// - 按鈕樣式：`elevatedButtonTheme`
class AppTheme {
  /// 光亮模式主題設定
  static final lightTheme = ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.lightBackground,
      brightness: Brightness.light,
      fontFamily: 'Satoshi',
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)))));

  /// 暗色模式主題設定
  static final darkTheme = ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.darkBackground,
      brightness: Brightness.dark,
      fontFamily: 'Satoshi',
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)))));
}
