import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../design_system/design_system.dart';
import '../../l10n/app_localizations.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SectionContainer(
      fillHeight: true,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = Breakpoints.isDesktop(constraints.maxWidth);
          final useMobileLayout = !isDesktop;

          final content = Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: useMobileLayout ? .center : .start,
            children: [
              Text(
                l10n.aboutMe_heroGreeting,
                style: AppTypography.monospace.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
              const SizedBox(height: AppSpacings.s20),
              Text(
                    'Maurici Ferreira Junior',
                    style: AppTypography.sectionTitle.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  )
                  .animate()
                  .fadeIn(delay: 200.ms, duration: 600.ms)
                  .slideX(begin: -0.2),
              const SizedBox(height: AppSpacings.s20),
              Text(
                    l10n.aboutMe_heroIntro,
                    style: AppTypography.monospace.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                  .animate()
                  .fadeIn(delay: 400.ms, duration: 600.ms)
                  .slideX(begin: -0.2),
              const SizedBox(height: AppSpacings.s40),
              const Row(
                mainAxisAlignment: .center,
                children: [
                  SocialButton(
                    icon: FontAwesomeIcons.github,
                    url: 'https://github.com/mauricifj',
                  ),
                  SizedBox(width: AppSpacings.s20),
                  SocialButton(
                    icon: FontAwesomeIcons.linkedin,
                    url: 'https://www.linkedin.com/in/mauricifj/',
                  ),
                  SizedBox(width: AppSpacings.s20),
                  SocialButton(
                    icon: FontAwesomeIcons.instagram,
                    url: 'https://www.instagram.com/mauricifj/',
                  ),
                ],
              ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2, end: 0),
              const SizedBox(height: AppSpacings.s30),
              const Row(
                mainAxisAlignment: .center,
                children: [
                  ShareButtonWidget(),
                  SizedBox(width: AppSpacings.s20),
                  AppStoreButton(isApple: true),
                  SizedBox(width: AppSpacings.s20),
                  AppStoreButton(isApple: false),
                ],
              ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.2, end: 0),
            ],
          );

          final image = Center(
            child: ProfileImage(
              size: useMobileLayout
                  ? AppSizes.profileImageMobile
                  : AppSizes.profileImageDesktop,
              errorIconSize: useMobileLayout
                  ? AppSizes.profileErrorIconMobile
                  : AppSizes.profileErrorIconDesktop,
            ).animate().fadeIn(delay: 400.ms, duration: 800.ms).scale(),
          );

          if (useMobileLayout) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  image,
                  const SizedBox(height: AppSpacings.s40),
                  content,
                ],
              ),
            );
          }

          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Row(
              children: [
                Expanded(flex: 3, child: content),
                Expanded(flex: 2, child: image),
              ],
            ),
          );
        },
      ),
    );
  }
}
