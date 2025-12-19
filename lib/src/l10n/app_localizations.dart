import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('pt'),
  ];

  /// No description provided for @app_title.
  ///
  /// In en, this message translates to:
  /// **'Mauricifj Portfolio'**
  String get app_title;

  /// No description provided for @app_description.
  ///
  /// In en, this message translates to:
  /// **'Personal Portfolio Website'**
  String get app_description;

  /// No description provided for @aboutMe_title.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutMe_title;

  /// No description provided for @aboutMe_heroGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hello, I\'m'**
  String get aboutMe_heroGreeting;

  /// No description provided for @aboutMe_heroIntro.
  ///
  /// In en, this message translates to:
  /// **'A passionate developer creating beautiful digital experiences.'**
  String get aboutMe_heroIntro;

  /// No description provided for @experience_title.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience_title;

  /// No description provided for @experience_roleLabel.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get experience_roleLabel;

  /// No description provided for @experience_companyLabel.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get experience_companyLabel;

  /// No description provided for @experience_durationLabel.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get experience_durationLabel;

  /// No description provided for @experience_technologiesLabel.
  ///
  /// In en, this message translates to:
  /// **'Technologies'**
  String get experience_technologiesLabel;

  /// No description provided for @education_title.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get education_title;

  /// No description provided for @projects_title.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects_title;

  /// No description provided for @projects_viewProjectButton.
  ///
  /// In en, this message translates to:
  /// **'View Project'**
  String get projects_viewProjectButton;

  /// No description provided for @contact_title.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact_title;

  /// No description provided for @settings_languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get settings_languageTitle;

  /// No description provided for @settings_languageCurrent.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settings_languageCurrent;

  /// No description provided for @settings_themeTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Theme'**
  String get settings_themeTitle;

  /// No description provided for @settings_themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settings_themeSystem;

  /// No description provided for @settings_themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settings_themeLight;

  /// No description provided for @settings_themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settings_themeDark;

  /// No description provided for @common_present.
  ///
  /// In en, this message translates to:
  /// **'Present'**
  String get common_present;

  /// Error message when a URL cannot be launched
  ///
  /// In en, this message translates to:
  /// **'Oops! I couldn\'t open that link. Here is the URL: {url}'**
  String common_errorLaunchUrl(String url);

  /// No description provided for @common_errorLoading.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while loading the content. Please try again later.'**
  String get common_errorLoading;

  /// No description provided for @language_english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language_english;

  /// No description provided for @language_portuguese.
  ///
  /// In en, this message translates to:
  /// **'Português'**
  String get language_portuguese;

  /// No description provided for @language_french.
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get language_french;

  /// No description provided for @language_spanish.
  ///
  /// In en, this message translates to:
  /// **'Español'**
  String get language_spanish;

  /// No description provided for @language_german.
  ///
  /// In en, this message translates to:
  /// **'Deutsch'**
  String get language_german;

  /// No description provided for @share_button_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Share this page'**
  String get share_button_tooltip;

  /// No description provided for @share_title.
  ///
  /// In en, this message translates to:
  /// **'Check out my portfolio!'**
  String get share_title;

  /// No description provided for @share_text.
  ///
  /// In en, this message translates to:
  /// **'Check out my portfolio at mauricifj.dev'**
  String get share_text;

  /// No description provided for @app_store_button_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Download on the App Store'**
  String get app_store_button_tooltip;

  /// No description provided for @play_store_button_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Get it on Google Play'**
  String get play_store_button_tooltip;

  /// No description provided for @coming_soon_message.
  ///
  /// In en, this message translates to:
  /// **'Coming soon! Stay tuned for the mobile app.'**
  String get coming_soon_message;

  /// No description provided for @privacyPolicy_title.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy_title;

  /// No description provided for @privacyPolicy_lastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated:'**
  String get privacyPolicy_lastUpdated;

  /// No description provided for @termsOfUse_title.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfUse_title;

  /// No description provided for @termsOfUse_lastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated:'**
  String get termsOfUse_lastUpdated;

  /// No description provided for @support_title.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support_title;

  /// No description provided for @support_description.
  ///
  /// In en, this message translates to:
  /// **'Need help or have questions regarding the portfolio app? You can reach out to me via the following channels:'**
  String get support_description;

  /// No description provided for @footer_copyright.
  ///
  /// In en, this message translates to:
  /// **'© {year} Mauricifj. All rights reserved.'**
  String footer_copyright(String year);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'es', 'fr', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
