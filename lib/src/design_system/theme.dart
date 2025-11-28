import 'package:flutter/material.dart';

import 'colors.dart';
import 'typography.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: .fromSeed(seedColor: AppColors.seed, brightness: .light),
    textTheme: AppTypography.textTheme.apply(
      fontFamilyFallback: ['NotoColorEmoji'],
    ),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    colorScheme: .fromSeed(seedColor: AppColors.seed, brightness: .dark),
    textTheme: AppTypography.textTheme.apply(
      bodyColor: AppColors.white,
      displayColor: AppColors.white,
      fontFamilyFallback: ['NotoColorEmoji'],
    ),
  );
}
