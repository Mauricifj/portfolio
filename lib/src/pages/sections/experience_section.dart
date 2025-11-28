import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../common/async_list_builder.dart';
import '../../design_system/design_system.dart';
import '../../l10n/app_localizations.dart';
import '../../models/models.dart';
import '../../providers/providers.dart';
import 'experience/experience_card_fit_content.dart';
import 'experience/experience_grid_layout.dart';

class ExperienceSection extends ConsumerWidget {
  const ExperienceSection({super.key});

  int _getColumnCount(double width) {
    const maxCardWidth = 400.0;
    final columns = (width / maxCardWidth).floor();
    return columns.clamp(1, 4);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final appLanguage = AppLanguage.fromCode(locale);
    final dateFormat = DateFormat.yMMM(locale);
    final experiencesAsync = ref.watch(experiencesProvider);

    return SectionContainer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = Breakpoints.isDesktop(constraints.maxWidth);
          final columnCount = _getColumnCount(constraints.maxWidth);

          return Column(
            crossAxisAlignment: .start,
            mainAxisSize: .min,
            children: [
              Text(
                l10n.experience_title,
                style: AppTypography.sectionTitle.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ).animate().fadeIn().slideX(),
              const SizedBox(height: AppSpacings.s40),
              experiencesAsync.when(
                data: (experiences) {
                  if (isDesktop && columnCount > 1) {
                    return ExperienceGridLayout(
                      experiences: experiences,
                      dateFormat: dateFormat,
                      appLanguage: appLanguage,
                      l10n: l10n,
                      columnCount: columnCount,
                    );
                  } else {
                    return Column(
                      children: experiences.map((exp) {
                        final start = dateFormat.format(exp.startDate);
                        final end = exp.endDate != null
                            ? dateFormat.format(exp.endDate!)
                            : l10n.common_present;
                        final duration = '$start - $end';

                        return Padding(
                          padding: const .only(bottom: AppSpacings.s20),
                          child: ExperienceCardFitContent(
                            title: exp.role,
                            subtitle: exp.company,
                            duration: duration,
                            description: exp.description,
                            location: exp.location,
                            locationType: exp.locationType,
                            technologies: exp.technologies,
                            language: appLanguage,
                          ),
                        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2);
                      }).toList(),
                    );
                  }
                },
                loading: AsyncListBuilder.loadingBuilder(isDesktop: isDesktop),
                error: AsyncListBuilder.errorBuilder(context),
              ),
            ],
          );
        },
      ),
    );
  }
}
