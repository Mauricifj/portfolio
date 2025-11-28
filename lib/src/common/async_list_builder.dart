import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../design_system/design_system.dart';
import '../l10n/app_localizations.dart';

class AsyncListBuilder {
  const AsyncListBuilder._();

  static Widget loading({required bool isDesktop, int count = 3}) {
    return CardListShimmer(isDesktop: isDesktop, count: count);
  }

  static Widget error(BuildContext context, Object error, StackTrace? stack) {
    final l10n = AppLocalizations.of(context)!;

    if (kDebugMode) {
      return Center(child: Text('Error: $error'));
    }
    return Center(child: Text(l10n.common_errorLoading));
  }

  static Widget Function() loadingBuilder({
    required bool isDesktop,
    int count = 3,
  }) {
    return () => loading(isDesktop: isDesktop, count: count);
  }

  static Widget Function(Object, StackTrace) errorBuilder(
    BuildContext context,
  ) {
    return (error, stack) => AsyncListBuilder.error(context, error, stack);
  }
}
