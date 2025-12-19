// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get app_title => 'Portafolio Mauricifj';

  @override
  String get app_description => 'Sitio Web de Portafolio Personal';

  @override
  String get aboutMe_title => 'Sobre Mí';

  @override
  String get aboutMe_heroGreeting => 'Hola, soy';

  @override
  String get aboutMe_heroIntro =>
      'Un desarrollador apasionado creando hermosas experiencias digitales.';

  @override
  String get experience_title => 'Experiencia';

  @override
  String get experience_roleLabel => 'Rol';

  @override
  String get experience_companyLabel => 'Empresa';

  @override
  String get experience_durationLabel => 'Duración';

  @override
  String get experience_technologiesLabel => 'Tecnologías';

  @override
  String get education_title => 'Educación';

  @override
  String get projects_title => 'Proyectos';

  @override
  String get projects_viewProjectButton => 'Ver Proyecto';

  @override
  String get contact_title => 'Contacto';

  @override
  String get settings_languageTitle => 'Cambiar idioma';

  @override
  String get settings_languageCurrent => 'Español';

  @override
  String get settings_themeTitle => 'Cambiar tema';

  @override
  String get settings_themeSystem => 'Sistema';

  @override
  String get settings_themeLight => 'Claro';

  @override
  String get settings_themeDark => 'Oscuro';

  @override
  String get common_present => 'Actualidad';

  @override
  String common_errorLaunchUrl(String url) {
    return '¡Vaya! No pude abrir ese enlace. Aquí está la URL: $url';
  }

  @override
  String get common_errorLoading =>
      'Algo salió mal al cargar el contenido. Por favor, inténtalo de nuevo más tarde.';

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
  String get share_button_tooltip => 'Compartir esta página';

  @override
  String get share_title => '¡Descubre mi portafolio!';

  @override
  String get share_text => 'Descubre mi portafolio en mauricifj.dev';

  @override
  String get app_store_button_tooltip => 'Descargar en la App Store';

  @override
  String get play_store_button_tooltip => 'Disponible en Google Play';

  @override
  String get coming_soon_message =>
      '¡Próximamente! Mantente atento a la aplicación móvil.';

  @override
  String get privacyPolicy_title => 'Política de Privacidad';

  @override
  String get privacyPolicy_lastUpdated => 'Última actualización:';

  @override
  String get termsOfUse_title => 'Términos de Uso';

  @override
  String get termsOfUse_lastUpdated => 'Última actualización:';

  @override
  String get support_title => 'Soporte';

  @override
  String get support_description =>
      '¿Necesita ayuda o tiene preguntas sobre la aplicación de portafolio? Puede comunicarse conmigo a través de los siguientes canales:';

  @override
  String footer_copyright(String year) {
    return '© $year Mauricifj. Todos los derechos reservados.';
  }
}
