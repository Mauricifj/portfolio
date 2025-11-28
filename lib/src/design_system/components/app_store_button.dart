import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../l10n/app_localizations.dart';
import '../spacings.dart';

class AppStoreButton extends StatelessWidget {
  const AppStoreButton({super.key, required this.isApple});

  final bool isApple;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return IconButton(
      onPressed: () => _onPressed(context, l10n),
      icon: FaIcon(
        isApple ? FontAwesomeIcons.appStore : FontAwesomeIcons.googlePlay,
      ),
      iconSize: AppSizes.iconMedium,
      color: Theme.of(context).colorScheme.primary,
      tooltip: isApple
          ? l10n.app_store_button_tooltip
          : l10n.play_store_button_tooltip,
    );
  }

  void _onPressed(BuildContext context, AppLocalizations l10n) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.coming_soon_message)));
  }
}
