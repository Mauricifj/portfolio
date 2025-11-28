import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';
import '../spacings.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.icon, required this.url});

  final IconData icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final uri = Uri.parse(url);
        try {
          if (!await launchUrl(uri)) {
            if (context.mounted) {
              final l10n = AppLocalizations.of(context)!;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.common_errorLaunchUrl(url))),
              );
            }
          }
        } on Exception catch (e) {
          debugPrint('Error launching URL: $e');
          if (context.mounted) {
            _showErrorSnackBar(context, url);
          }
        }
      },
      icon: FaIcon(icon),
      iconSize: AppSizes.iconMedium,
      color: Theme.of(context).colorScheme.primary,
      tooltip: url,
    );
  }

  void _showErrorSnackBar(BuildContext context, String url) {
    final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.common_errorLaunchUrl(url))));
  }
}
