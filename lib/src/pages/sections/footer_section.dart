import 'package:flutter/material.dart';

import '../../design_system/design_system.dart';
import '../../l10n/app_localizations.dart';
import '../legal/privacy_policy_page.dart';
import '../legal/terms_of_use_page.dart';
import '../support_page.dart';
import 'widgets/footer_link.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
                label: l10n.privacyPolicy_title,
                onTap: () =>
                    Navigator.pushNamed(context, PrivacyPolicyPage.routeName),
              ),
              FooterLink(
                label: l10n.termsOfUse_title,
                onTap: () =>
                    Navigator.pushNamed(context, TermsOfUsePage.routeName),
              ),
              FooterLink(
                label: l10n.support_title,
                onTap: () =>
                    Navigator.pushNamed(context, SupportPage.routeName),
              ),
            ],
          ),
          const SizedBox(height: AppSpacings.s16),
          Text(
            l10n.footer_copyright(DateTime.now().year.toString()),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
