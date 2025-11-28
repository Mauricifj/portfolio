import 'package:flutter/material.dart';

import '../../models/app_language.dart';
import '../../models/technology.dart';
import '../design_system.dart';

class ContentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String duration;
  final String description;
  final List<Technology>? tags;
  final AppLanguage? language;
  final VoidCallback? onTap;

  const ContentCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.description,
    this.tags,
    this.language,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : null;
        final height = constraints.maxHeight.isFinite
            ? constraints.maxHeight
            : null;

        return SizedBox(
          width: width,
          height: height,
          child: Card(
            elevation: AppElevations.card,
            shape: RoundedRectangleBorder(
              borderRadius: .circular(AppSizes.cardRadius),
            ),
            child: InkWell(
              onTap: onTap,
              borderRadius: .circular(AppSizes.cardRadius),
              child: ClipRRect(
                borderRadius: .circular(AppSizes.cardRadius),
                child: Padding(
                  padding: const .all(AppSpacings.s24),
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: .start,
                        mainAxisSize: .min,
                        children: [
                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(title, style: AppTypography.cardTitle),
                              if (duration.isNotEmpty) ...[
                                const SizedBox(height: AppSpacings.s4),
                                Text(
                                  duration,
                                  style: AppTypography.monospaceSmall.copyWith(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ],
                          ),
                          if (subtitle.isNotEmpty) ...[
                            const SizedBox(height: AppSpacings.s8),
                            Text(
                              subtitle,
                              style: AppTypography.cardSubtitle.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                          const SizedBox(height: AppSpacings.s16),
                          Text(description, style: AppTypography.bodySmall),
                        ],
                      ),
                      if (tags != null &&
                          tags!.isNotEmpty &&
                          language != null) ...[
                        const SizedBox(height: AppSpacings.s16),
                        Wrap(
                          spacing: AppSpacings.s8,
                          runSpacing: AppSpacings.s8,
                          children: tags!
                              .map(
                                (tag) => Chip(
                                  label: Text(
                                    tag.displayName(language!),
                                    style: AppTypography.tag,
                                  ),
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withValues(
                                        alpha: AppOpacity.chipBackground,
                                      ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
