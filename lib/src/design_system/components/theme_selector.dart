import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../spacings.dart';
import '../typography.dart';

class ThemeSelector extends StatelessWidget {
  final ThemeMode currentThemeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  const ThemeSelector({
    super.key,
    required this.currentThemeMode,
    required this.onThemeModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PopupMenuButton<ThemeMode>(
      tooltip: l10n.settings_themeTitle,
      icon: Text(
        currentThemeMode == .system
            ? '🌓'
            : currentThemeMode == .light
            ? '☀️'
            : '🌙',
        style: AppTypography.iconSmall,
      ),
      onSelected: onThemeModeChanged,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: .system,
          child: Row(
            children: [
              Text('🌓', style: AppTypography.iconSmall),
              const SizedBox(width: AppSpacings.s8),
              Text(l10n.settings_themeSystem),
            ],
          ),
        ),
        PopupMenuItem(
          value: .light,
          child: Row(
            children: [
              Text('☀️', style: AppTypography.iconSmall),
              const SizedBox(width: AppSpacings.s8),
              Text(l10n.settings_themeLight),
            ],
          ),
        ),
        PopupMenuItem(
          value: .dark,
          child: Row(
            children: [
              Text('🌙', style: AppTypography.iconSmall),
              const SizedBox(width: AppSpacings.s8),
              Text(l10n.settings_themeDark),
            ],
          ),
        ),
      ],
    );
  }
}
