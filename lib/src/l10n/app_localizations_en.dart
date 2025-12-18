// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'Mauricifj Portfolio';

  @override
  String get app_description => 'Personal Portfolio Website';

  @override
  String get aboutMe_title => 'About Me';

  @override
  String get aboutMe_heroGreeting => 'Hello, I\'m';

  @override
  String get aboutMe_heroIntro =>
      'A passionate developer creating beautiful digital experiences.';

  @override
  String get experience_title => 'Experience';

  @override
  String get experience_roleLabel => 'Role';

  @override
  String get experience_companyLabel => 'Company';

  @override
  String get experience_durationLabel => 'Duration';

  @override
  String get experience_technologiesLabel => 'Technologies';

  @override
  String get education_title => 'Education';

  @override
  String get projects_title => 'Projects';

  @override
  String get projects_viewProjectButton => 'View Project';

  @override
  String get contact_title => 'Contact';

  @override
  String get settings_languageTitle => 'Change Language';

  @override
  String get settings_languageCurrent => 'English';

  @override
  String get settings_themeTitle => 'Change Theme';

  @override
  String get settings_themeSystem => 'System';

  @override
  String get settings_themeLight => 'Light';

  @override
  String get settings_themeDark => 'Dark';

  @override
  String get common_present => 'Present';

  @override
  String common_errorLaunchUrl(String url) {
    return 'Oops! I couldn\'t open that link. Here is the URL: $url';
  }

  @override
  String get common_errorLoading =>
      'Something went wrong while loading the content. Please try again later.';

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
  String get share_button_tooltip => 'Share this page';

  @override
  String get share_title => 'Check out my portfolio!';

  @override
  String get share_text => 'Check out my portfolio at mauricifj.dev';

  @override
  String get app_store_button_tooltip => 'Download on the App Store';

  @override
  String get play_store_button_tooltip => 'Get it on Google Play';

  @override
  String get coming_soon_message =>
      'Coming soon! Stay tuned for the mobile app.';

  @override
  String get privacyPolicy_title => 'Privacy Policy';

  @override
  String get privacyPolicy_lastUpdated => 'Last updated:';

  @override
  String get termsOfUse_title => 'Terms of Use';

  @override
  String get termsOfUse_lastUpdated => 'Last updated:';

  @override
  String get support_title => 'Support';

  @override
  String get support_description =>
      'Need help or have questions regarding the portfolio app? You can reach out to me via the following channels:';
}
