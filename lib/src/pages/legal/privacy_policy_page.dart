// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../design_system/design_system.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/providers.dart';

class PrivacyPolicyPage extends ConsumerWidget {
  const PrivacyPolicyPage({super.key});

  static const String routeName = '/privacy-policy';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final legalDataAsync = ref.watch(legalDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.privacyPolicy_title),
      ),
      body: legalDataAsync.when(
        data: (data) {
          final content = data.privacyPolicy;
          return SingleChildScrollView(
            padding: const .all(AppSpacings.s16),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  AppLocalizations.of(context)!.privacyPolicy_title,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(fontWeight: .bold),
                ),
                const SizedBox(height: AppSpacings.s16),
                Text(
                  '${AppLocalizations.of(context)!.privacyPolicy_lastUpdated} ${content.date}',
                  style: AppTypography.bodySmall.copyWith(fontStyle: .italic),
                ),
                const SizedBox(height: AppSpacings.s16),
                ...content.sections.map((section) {
                  return Padding(
                    padding: const .only(bottom: AppSpacings.s16),
                    child: Text(
                      section.content,
                      style: AppTypography.bodyMedium.copyWith(height: 1.5),
                    ),
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
}
