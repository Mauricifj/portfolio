import 'package:flutter/material.dart';

import '../../design_system/design_system.dart';
import '../../l10n/app_localizations.dart';

class NavigationItem {
  final Widget icon;
  final Widget selectedIcon;
  final String label;

  NavigationItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}

class NavigationItems {
  const NavigationItems._();

  static List<NavigationItem> getItems(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return [
      NavigationItem(
        icon: Text('👨‍💻', style: AppTypography.iconLarge),
        selectedIcon: Text('👨‍💻', style: AppTypography.iconLarge),
        label: l10n.aboutMe_title,
      ),
      NavigationItem(
        icon: Text('💼', style: AppTypography.iconLarge),
        selectedIcon: Text('💼', style: AppTypography.iconLarge),
        label: l10n.experience_title,
      ),
      NavigationItem(
        icon: Text('🚀', style: AppTypography.iconLarge),
        selectedIcon: Text('🚀', style: AppTypography.iconLarge),
        label: l10n.projects_title,
      ),
      NavigationItem(
        icon: Text('🎓', style: AppTypography.iconLarge),
        selectedIcon: Text('🎓', style: AppTypography.iconLarge),
        label: l10n.education_title,
      ),
    ];
  }
}
