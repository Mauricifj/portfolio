import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../l10n/app_localizations.dart';
import '../spacings.dart';

class ShareButtonWidget extends StatelessWidget {
  const ShareButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return IconButton(
      onPressed: () => _onSharePressed(context, l10n),
      icon: const FaIcon(FontAwesomeIcons.shareNodes),
      iconSize: AppSizes.iconMedium,
      color: Theme.of(context).colorScheme.primary,
      tooltip: l10n.share_button_tooltip,
    );
  }

  Future<void> _onSharePressed(
    BuildContext context,
    AppLocalizations l10n,
  ) async {
    try {
      final uri = Uri.parse('https://mauricifj.dev');
      await Share.shareUri(uri);
    } on Exception catch (e) {
      debugPrint('Error sharing: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.common_errorLoading)));
      }
    }
  }
}
