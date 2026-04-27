import 'package:flutter/material.dart';
import 'package:growgypt/core/theme/app_colors.dart';

class AppTextStyles {

  // Headline
  static final TextStyle h1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  static final TextStyle h2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  static final TextStyle h3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  // Price display (the big number on stock detail)
  static final TextStyle priceMain = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  static final TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText,
  );
  static final TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText,
  );
  static final TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryText,
  );


    // Dynamic method — returns green or red style

    static TextStyle priceChange(bool isPositive) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: isPositive ? AppColors.stockGreen : AppColors.stockRed,
    );
  }

}
