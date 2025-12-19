import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../design_system/design_system.dart';
import '../l10n/app_localizations.dart';
import '../models/support_channel_type.dart';
import '../providers/providers.dart';

class SupportPage extends ConsumerWidget {
  const SupportPage({super.key});

  static const String routeName = '/support';

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final legalDataAsync = ref.watch(supportDataProvider);
    final locale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.support_title),
        actions: [
          LanguageSelector(
            currentLocale: locale,
            onLocaleChanged: (newLocale) {
              ref.read(localeProvider.notifier).state = newLocale;
            },
          ),
          ThemeSelector(
            currentThemeMode: themeMode,
            onThemeModeChanged: (newThemeMode) {
              ref.read(themeModeProvider.notifier).state = newThemeMode;
            },
          ),
        ],
      ),
      body: legalDataAsync.when(
        data: (data) {
          final content = data;
          return SingleChildScrollView(
            padding: const .all(AppSpacings.s24),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  AppLocalizations.of(context)!.support_title,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(fontWeight: .bold),
                ),
                const SizedBox(height: AppSpacings.s24),
                Text(
                  AppLocalizations.of(context)!.support_description,
                  style: AppTypography.bodyMedium.copyWith(height: 1.5),
                ),
                const SizedBox(height: AppSpacings.s32),
                ...content.channels.map((channel) {
                  return ListTile(
                    leading: Icon(_getIconForType(channel.type)),
                    title: Text(channel.title),
                    subtitle: Text(channel.subtitle),
                    onTap: () => _launchUrl(channel.url),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  );
                }),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text(
            AppLocalizations.of(context)!.common_errorLoading,
            style: AppTypography.bodyMedium,
          ),
        ),
      ),
    );
  }

  IconData _getIconForType(SupportChannelType type) {
    switch (type) {
      case .email:
        return Icons.email_outlined;
      case .linkedin:
        return Icons.work_outline;
      case .unknown:
        return Icons.link;
    }
  }
}
