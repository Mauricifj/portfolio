import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/async_list_builder.dart';
import '../../design_system/design_system.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/providers.dart';

class EducationSection extends ConsumerWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final educationAsync = ref.watch(educationProvider);

    return SectionContainer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = Breakpoints.isDesktop(constraints.maxWidth);

          return Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                l10n.education_title,
                style: AppTypography.sectionTitle.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ).animate().fadeIn().slideX(),
              const SizedBox(height: AppSpacings.s40),
              educationAsync.when(
                data: (education) {
                  if (isDesktop) {
                    return Wrap(
                      spacing: AppSpacings.s20,
                      runSpacing: AppSpacings.s20,
                      children: education.map((edu) {
                        return SizedBox(
                          width: AppSizes.cardWidth,
                          height: AppSizes.cardHeight,
                          child: ContentCard(
                            title: edu.degree,
                            subtitle: edu.institution,
                            duration: edu.duration,
                            description: edu.description,
                          ),
                        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2);
                      }).toList(),
                    );
                  } else {
                    return Column(
                      children: education.map((edu) {
                        return Padding(
                          padding: const .only(bottom: AppSpacings.s20),
                          child: ContentCard(
                            title: edu.degree,
                            subtitle: edu.institution,
                            duration: edu.duration,
                            description: edu.description,
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
