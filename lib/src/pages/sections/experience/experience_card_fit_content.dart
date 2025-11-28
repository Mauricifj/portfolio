import 'package:flutter/material.dart';

import '../../../design_system/design_system.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/models.dart';

class ExperienceCardFitContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String duration;
  final String description;
  final String location;
  final LocationType locationType;
  final List<Technology> technologies;
  final AppLanguage language;

  const ExperienceCardFitContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.description,
    required this.location,
    required this.locationType,
    required this.technologies,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Card(
      elevation: AppElevations.card,
      shape: RoundedRectangleBorder(
        borderRadius: .circular(AppSizes.cardRadius),
      ),
      child: ClipRRect(
        borderRadius: .circular(AppSizes.cardRadius),
        child: Padding(
          padding: const .all(AppSpacings.s24),
          child: Column(
            crossAxisAlignment: .start,
            mainAxisSize: .min,
            children: [
              Text(title, style: AppTypography.cardTitle),
              const SizedBox(height: AppSpacings.s4),
              Text(
                subtitle,
                style: AppTypography.cardSubtitle.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: AppSpacings.s8),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: AppSizes.iconExtraSmall,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: AppSpacings.s4),
                  Expanded(
                    child: Text(
                      location,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      overflow: .ellipsis,
                    ),
                  ),
                  if (locationType.isVisible) ...[
                    const SizedBox(width: AppSpacings.s8),
                    Container(
                      padding: const .symmetric(
                        horizontal: AppSpacings.s8,
                        vertical: AppSpacings.s4,
                      ),
                      decoration: BoxDecoration(
                        color: locationType.color.withValues(
                          alpha: AppOpacity.chipBackground,
                        ),
                        borderRadius: .circular(AppSizes.radiusSmall),
                      ),
                      child: Text(
                        locationType.label,
                        style: AppTypography.tag.copyWith(
                          color: locationType.color,
                          fontWeight: .w600,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: AppSpacings.s4),
              Text(
                duration,
                style: AppTypography.monospaceSmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacings.s16),
              Text(description, style: AppTypography.bodySmall),
              if (technologies.isNotEmpty) ...[
                const SizedBox(height: AppSpacings.s16),
                Text(
                  l10n.experience_technologiesLabel,
                  style: AppTypography.labelLarge,
                ),
                const SizedBox(height: AppSpacings.s8),
                Wrap(
                  spacing: AppSpacings.s8,
                  runSpacing: AppSpacings.s8,
                  children: technologies.map((tech) {
                    return Chip(
                      label: Text(
                        tech.displayName(language),
                        style: AppTypography.tag,
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary
                          .withValues(alpha: AppOpacity.chipBackground),
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
