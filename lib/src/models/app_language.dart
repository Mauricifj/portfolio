import 'dart:ui';

enum AppLanguage {
  en('en'),
  pt('pt'),
  fr('fr'),
  es('es'),
  de('de'),
  unspecified('unspecified');

  final String code;
  const AppLanguage(this.code);

  static AppLanguage fromCode(String code) {
    return values.firstWhere(
      (lang) => lang.code == code,
      orElse: () => unspecified,
    );
  }

  static List<Locale> get locales => values
      .where((lang) => lang != unspecified)
      .map((lang) => lang.locale)
      .toList();

  Locale get locale => Locale(code);

  String get flag {
    switch (this) {
      case en:
        return '🇺🇸';
      case pt:
        return '🇧🇷';
      case fr:
        return '🇫🇷';
      case es:
        return '🇪🇸';
      case de:
        return '🇩🇪';
      case unspecified:
        return '';
    }
  }
}
