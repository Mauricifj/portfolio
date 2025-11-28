import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/async_list_builder.dart';
import '../../design_system/design_system.dart';
import '../../l10n/app_localizations.dart';
import '../../models/models.dart';
import '../../providers/providers.dart';

class ProjectsSection extends ConsumerWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final appLanguage = AppLanguage.fromCode(locale);
    final projectsAsync = ref.watch(projectsProvider);

    return SectionContainer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = Breakpoints.isDesktop(constraints.maxWidth);

          return Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                l10n.projects_title,
                style: AppTypography.sectionTitle.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ).animate().fadeIn().slideX(),
              const SizedBox(height: AppSpacings.s40),
              projectsAsync.when(
                data: (projects) {
                  if (isDesktop) {
                    return Wrap(
                      spacing: AppSpacings.s20,
                      runSpacing: AppSpacings.s20,
                      children: projects.map((project) {
                        return SizedBox(
                          width: AppSizes.cardWidth,
                          height: AppSizes.cardHeight,
                          child: ContentCard(
                            title: project.title,
                            subtitle: '',
                            duration: '',
                            description: project.description,
                            tags: project.technologies,
                            language: appLanguage,
                            onTap: () async {
                              final Uri url = Uri.parse(project.link);
                              if (!await launchUrl(url)) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        l10n.common_errorLaunchUrl(
                                          project.link,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2);
                      }).toList(),
                    );
                  } else {
                    return Column(
                      children: projects.map((project) {
                        return Padding(
                          padding: const .only(bottom: AppSpacings.s20),
                          child: ContentCard(
                            title: project.title,
                            subtitle: '',
                            duration: '',
                            description: project.description,
                            tags: project.technologies,
                            language: appLanguage,
                            onTap: () async {
                              final Uri url = Uri.parse(project.link);
                              if (!await launchUrl(url)) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        l10n.common_errorLaunchUrl(
                                          project.link,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
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
