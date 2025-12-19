import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta_seo/meta_seo.dart';

import 'src/config/configure_non_web.dart'
    if (dart.library.html) 'src/config/configure_web.dart';
import 'src/design_system/design_system.dart';
import 'src/l10n/app_localizations.dart';
import 'src/models/models.dart';
import 'src/pages/pages.dart';
import 'src/providers/providers.dart';

void main() {
  configureApp();
  if (kIsWeb) {
    MetaSEO().config();
  }
  runApp(const ProviderScope(child: PortfolioApp()));
}

class PortfolioApp extends ConsumerWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeModeProvider);

    final l10n = AppLocalizations.of(context);
    if (l10n != null) {
      final meta = MetaSEO();
      meta.ogTitle(ogTitle: l10n.app_title);
      meta.ogDescription(ogDescription: l10n.app_description);
      meta.ogImage(
        ogImage:
            'https://mauricifj.dev/assets/images/og-image-${l10n.localeName}.png',
      );
    }

    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.app_title,
      themeMode: themeMode,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLanguage.locales,
      routes: {
        PrivacyPolicyPage.routeName: (context) => const PrivacyPolicyPage(),
        TermsOfUsePage.routeName: (context) => const TermsOfUsePage(),
        SupportPage.routeName: (context) => const SupportPage(),
      },
      home: const HomePage(),
    );
  }
}
