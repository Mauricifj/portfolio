import 'package:flutter/material.dart';

import '../../design_system/design_system.dart';
import '../legal/privacy_policy_page.dart';
import '../legal/terms_of_use_page.dart';
import '../support_page.dart';
import 'widgets/footer_link.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacings.s32),
      child: Column(
        children: [
          const Divider(),
          const SizedBox(height: AppSpacings.s16),
          Wrap(
            spacing: AppSpacings.s24,
            runSpacing: AppSpacings.s16,
            alignment: WrapAlignment.center,
            children: [
              FooterLink(
                label: 'Privacy Policy',
                onTap: () =>
                    Navigator.pushNamed(context, PrivacyPolicyPage.routeName),
              ),
              FooterLink(
                label: 'Terms of Use',
                onTap: () =>
                    Navigator.pushNamed(context, TermsOfUsePage.routeName),
              ),
              FooterLink(
                label: 'Support',
                onTap: () =>
                    Navigator.pushNamed(context, SupportPage.routeName),
              ),
            ],
          ),
          const SizedBox(height: AppSpacings.s16),
          Text(
            '© ${DateTime.now().year} Mauricifj. All rights reserved.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
