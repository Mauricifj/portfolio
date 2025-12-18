import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../design_system/design_system.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/providers.dart';

class TermsOfUsePage extends ConsumerWidget {
  const TermsOfUsePage({super.key});

  static const String routeName = '/terms-of-use';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final legalDataAsync = ref.watch(legalDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.termsOfUse_title),
      ),
      body: legalDataAsync.when(
        data: (data) {
          final content = data.termsOfUse;
          return SingleChildScrollView(
            padding: const .all(AppSpacings.s16),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  AppLocalizations.of(context)!.termsOfUse_title,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(fontWeight: .bold),
                ),
                const SizedBox(height: AppSpacings.s16),
                Text(
                  '${AppLocalizations.of(context)!.termsOfUse_lastUpdated} '
                  '${content.date}',
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
