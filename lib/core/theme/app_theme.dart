import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_constants.dart';

class AppTheme {
  // 现代化的颜色方案
  static const Color primaryPurple = Color(0xFF9945FF); // Solana紫色
  static const Color primaryGreen = Color(0xFF14F195); // Solana绿色
  static const Color darkPurple = Color(0xFF7C3AED);
  static const Color lightPurple = Color(0xFFE0E7FF);

  // 中性色
  static const Color neutral50 = Color(0xFFFAFAFA);
  static const Color neutral100 = Color(0xFFF5F5F5);
  static const Color neutral200 = Color(0xFFE5E5E5);
  static const Color neutral300 = Color(0xFFD4D4D4);
  static const Color neutral400 = Color(0xFFA3A3A3);
  static const Color neutral500 = Color(0xFF737373);
  static const Color neutral600 = Color(0xFF525252);
  static const Color neutral700 = Color(0xFF404040);
  static const Color neutral800 = Color(0xFF262626);
  static const Color neutral900 = Color(0xFF171717);

  // 状态颜色
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // 渐变色
  static const LinearGradient primaryGradient = LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [primaryPurple, darkPurple]);

  static const LinearGradient successGradient = LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [primaryGreen, success]);

  static const LinearGradient backgroundGradient = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [neutral50, neutral100]);

  // 阴影
  static const List<BoxShadow> softShadow = [BoxShadow(color: Color(0x0A000000), blurRadius: 8, offset: Offset(0, 2))];

  static const List<BoxShadow> mediumShadow = [BoxShadow(color: Color(0x14000000), blurRadius: 16, offset: Offset(0, 4))];

  static const List<BoxShadow> strongShadow = [BoxShadow(color: Color(0x1F000000), blurRadius: 24, offset: Offset(0, 8))];

  // 亮色主题
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryPurple, brightness: Brightness.light, primary: primaryPurple, secondary: primaryGreen, surface: neutral50, error: error),

      // AppBar主题
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: neutral800,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: TextStyle(color: neutral800, fontSize: 20, fontWeight: FontWeight.w600),
      ),

      // 按钮主题
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.largePadding, vertical: AppConstants.defaultPadding),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      // 卡片主题
      cardTheme: CardThemeData(
        elevation: 0,
        color: Colors.white,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
          side: BorderSide(color: neutral200, width: 1),
        ),
      ),

      // 输入框主题
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: neutral100,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
          borderSide: BorderSide(color: neutral200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
          borderSide: BorderSide(color: primaryPurple, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding, vertical: AppConstants.defaultPadding),
      ),

      // 文本主题
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: neutral900),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: neutral900),
        displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: neutral900),
        headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: neutral800),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: neutral800),
        headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: neutral800),
        titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: neutral800),
        titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: neutral700),
        titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: neutral600),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: neutral700),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: neutral600),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: neutral500),
      ),
    );
  }

  // 暗色主题（为将来准备）
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryPurple, brightness: Brightness.dark, primary: primaryPurple, secondary: primaryGreen, surface: neutral900, error: error),
      // 暗色主题的其他配置...
    );
  }
}
