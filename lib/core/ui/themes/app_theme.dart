part of 'theme.dart';

class AppThemes {
  static const String _font = 'SFProDisplay';

  static const iconTheme = IconThemeData(color: AppColors.secondary);

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    fontFamily: _font,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.white,
      onSurface: AppColors.secondary,
      primaryContainer: AppColors.primary,
      onPrimaryContainer: AppColors.white,
      error: AppColors.error,
    ),
    scaffoldBackgroundColor: AppColors.white,
    iconTheme: iconTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      titleTextStyle: AppTextStyle.button.copyWith(
        color: AppColors.secondary,
        fontWeight: FontWeight.bold,
        fontFamily: _font,
      ),
      iconTheme: iconTheme,
      centerTitle: false,
    ),
    badgeTheme: const BadgeThemeData(
      backgroundColor: AppColors.primary,
      textColor: AppColors.white,
    ),
    dividerTheme: const DividerThemeData(
      thickness: 1.5,
      color: AppColors.lightGrey,
      space: 1,
    ),
    useMaterial3: true,
    textTheme: TextTheme(
      displayLarge: AppTextStyle.title,
      displayMedium: AppTextStyle.subtitle,
      bodyLarge: AppTextStyle.body1,
      bodyMedium: AppTextStyle.body2,
      labelLarge: AppTextStyle.button,
      bodySmall: AppTextStyle.overline,
    ),
  );
}
