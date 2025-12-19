// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get app_title => 'Portfolio Mauricifj';

  @override
  String get app_description => 'Site Web de Portfolio Personnel';

  @override
  String get aboutMe_title => 'À Propos';

  @override
  String get aboutMe_heroGreeting => 'Bonjour, je suis';

  @override
  String get aboutMe_heroIntro =>
      'Un développeur passionné créant de belles expériences numériques.';

  @override
  String get experience_title => 'Expérience';

  @override
  String get experience_roleLabel => 'Rôle';

  @override
  String get experience_companyLabel => 'Entreprise';

  @override
  String get experience_durationLabel => 'Durée';

  @override
  String get experience_technologiesLabel => 'Technologies';

  @override
  String get education_title => 'Éducation';

  @override
  String get projects_title => 'Projets';

  @override
  String get projects_viewProjectButton => 'Voir le Projet';

  @override
  String get contact_title => 'Contact';

  @override
  String get settings_languageTitle => 'Changer de langue';

  @override
  String get settings_languageCurrent => 'Français';

  @override
  String get settings_themeTitle => 'Changer de thème';

  @override
  String get settings_themeSystem => 'Système';

  @override
  String get settings_themeLight => 'Clair';

  @override
  String get settings_themeDark => 'Sombre';

  @override
  String get common_present => 'Aujourd\'hui';

  @override
  String common_errorLaunchUrl(String url) {
    return 'Oups ! Je n\'ai pas pu ouvrir ce lien. Voici l\'URL : $url';
  }

  @override
  String get common_errorLoading =>
      'Une erreur s\'est produite lors du chargement du contenu. Veuillez réessayer plus tard.';

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
  String get share_button_tooltip => 'Partager cette page';

  @override
  String get share_title => 'Découvrez mon portfolio !';

  @override
  String get share_text => 'Découvrez mon portfolio sur mauricifj.dev';

  @override
  String get app_store_button_tooltip => 'Télécharger sur l\'App Store';

  @override
  String get play_store_button_tooltip => 'Disponible sur Google Play';

  @override
  String get coming_soon_message =>
      'Bientôt disponible ! Restez à l\'écoute pour l\'application mobile.';

  @override
  String get privacyPolicy_title => 'Politique de Confidentialité';

  @override
  String get privacyPolicy_lastUpdated => 'Dernière mise à jour :';

  @override
  String get termsOfUse_title => 'Conditions d\'Utilisation';

  @override
  String get termsOfUse_lastUpdated => 'Dernière mise à jour :';

  @override
  String get support_title => 'Support';

  @override
  String get support_description =>
      'Besoin d\'aide ou des questions concernant l\'application de portefeuille? Vous pouvez me contacter via les canaux suivants:';

  @override
  String footer_copyright(String year) {
    return '© $year Mauricifj. Tous droits réservés.';
  }
}
