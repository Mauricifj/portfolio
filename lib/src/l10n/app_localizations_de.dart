// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get app_title => 'Mauricifj Portfolio';

  @override
  String get app_description => 'Persönliche Portfolio-Website';

  @override
  String get aboutMe_title => 'Über Mich';

  @override
  String get aboutMe_heroGreeting => 'Hallo, ich bin';

  @override
  String get aboutMe_heroIntro =>
      'Ein leidenschaftlicher Entwickler, der schöne digitale Erlebnisse schafft.';

  @override
  String get experience_title => 'Erfahrung';

  @override
  String get experience_roleLabel => 'Rolle';

  @override
  String get experience_companyLabel => 'Unternehmen';

  @override
  String get experience_durationLabel => 'Dauer';

  @override
  String get experience_technologiesLabel => 'Technologien';

  @override
  String get education_title => 'Ausbildung';

  @override
  String get projects_title => 'Projekte';

  @override
  String get projects_viewProjectButton => 'Projekt Ansehen';

  @override
  String get contact_title => 'Kontakt';

  @override
  String get settings_languageTitle => 'Sprache ändern';

  @override
  String get settings_languageCurrent => 'Deutsch';

  @override
  String get settings_themeTitle => 'Thema ändern';

  @override
  String get settings_themeSystem => 'System';

  @override
  String get settings_themeLight => 'Hell';

  @override
  String get settings_themeDark => 'Dunkel';

  @override
  String get common_present => 'Gegenwart';

  @override
  String common_errorLaunchUrl(String url) {
    return 'Hoppla! Ich konnte diesen Link nicht öffnen. Hier ist die URL: $url';
  }

  @override
  String get common_errorLoading =>
      'Beim Laden des Inhalts ist ein Fehler aufgetreten. Bitte versuchen Sie es später erneut.';

  @override
  String get language_english => 'English';

  @override
  String get language_portuguese => 'Português';

  @override
  String get language_french => 'Français';

  @override
  String get language_spanish => 'Español';

  @override
  String get language_german => 'Deutsch';

  @override
  String get share_button_tooltip => 'Diese Seite teilen';

  @override
  String get share_title => 'Schauen Sie sich mein Portfolio an!';

  @override
  String get share_text =>
      'Schauen Sie sich mein Portfolio auf mauricifj.dev an';

  @override
  String get app_store_button_tooltip => 'Im App Store herunterladen';

  @override
  String get play_store_button_tooltip => 'Jetzt bei Google Play';

  @override
  String get coming_soon_message =>
      'Demnächst verfügbar! Bleiben Sie dran für die mobile App.';
}
