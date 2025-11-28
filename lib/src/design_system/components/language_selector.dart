import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../models/models.dart';
import '../design_system.dart';

class LanguageSelector extends StatelessWidget {
  final Locale currentLocale;
  final ValueChanged<Locale> onLocaleChanged;

  const LanguageSelector({
    super.key,
    required this.currentLocale,
    required this.onLocaleChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PopupMenuButton<Locale>(
      tooltip: l10n.settings_languageTitle,
      icon: Text(
        AppLanguage.fromCode(currentLocale.languageCode).flag,
        style: AppTypography.iconSmall,
      ),
      onSelected: onLocaleChanged,
      itemBuilder: (context) => AppLanguage.values
          .where((language) => language != .unspecified)
          .map((language) {
            return PopupMenuItem(
              value: Locale(language.code),
              child: Builder(
                builder: (context) {
                  return Localizations.override(
                    context: context,
                    locale: Locale(language.code),
                    child: Builder(
                      builder: (context) {
                        final langL10n = AppLocalizations.of(context)!;
                        return Row(
                          children: [
                            Text(language.flag, style: AppTypography.iconSmall),
                            const SizedBox(width: AppSpacings.s8),
                            Text(langL10n.settings_languageCurrent),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            );
          })
          .toList(),
    );
  }
}
