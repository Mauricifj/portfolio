// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get app_title => 'Portfólio Mauricifj';

  @override
  String get app_description => 'Site de Portfólio Pessoal';

  @override
  String get aboutMe_title => 'Sobre Mim';

  @override
  String get aboutMe_heroGreeting => 'Olá, eu sou';

  @override
  String get aboutMe_heroIntro =>
      'Um desenvolvedor apaixonado por criar belas experiências digitais.';

  @override
  String get experience_title => 'Experiência';

  @override
  String get experience_roleLabel => 'Cargo';

  @override
  String get experience_companyLabel => 'Empresa';

  @override
  String get experience_durationLabel => 'Duração';

  @override
  String get experience_technologiesLabel => 'Tecnologias';

  @override
  String get education_title => 'Educação';

  @override
  String get projects_title => 'Projetos';

  @override
  String get projects_viewProjectButton => 'Ver Projeto';

  @override
  String get contact_title => 'Contato';

  @override
  String get settings_languageTitle => 'Alterar Idioma';

  @override
  String get settings_languageCurrent => 'Português';

  @override
  String get settings_themeTitle => 'Alterar Tema';

  @override
  String get settings_themeSystem => 'Sistema';

  @override
  String get settings_themeLight => 'Claro';

  @override
  String get settings_themeDark => 'Escuro';

  @override
  String get common_present => 'Atualmente';

  @override
  String common_errorLaunchUrl(String url) {
    return 'Ops! Não consegui abrir esse link. Aqui está a URL: $url';
  }

  @override
  String get common_errorLoading =>
      'Algo deu errado ao carregar o conteúdo. Por favor, tente novamente mais tarde.';

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
  String get share_button_tooltip => 'Compartilhar esta página';

  @override
  String get share_title => 'Confira meu portfólio!';

  @override
  String get share_text => 'Confira meu portfólio em mauricifj.dev';

  @override
  String get app_store_button_tooltip => 'Baixar na App Store';

  @override
  String get play_store_button_tooltip => 'Disponível no Google Play';

  @override
  String get coming_soon_message =>
      'Em breve! Fique atento ao aplicativo móvel.';

  @override
  String get privacyPolicy_title => 'Política de Privacidade';

  @override
  String get privacyPolicy_lastUpdated => 'Última atualização:';

  @override
  String get termsOfUse_title => 'Termos de Uso';

  @override
  String get termsOfUse_lastUpdated => 'Última atualização:';

  @override
  String get support_title => 'Suporte';

  @override
  String get support_description =>
      'Precisa de ajuda ou tem perguntas sobre o aplicativo de portfólio? Você pode entrar em contato comigo através dos seguintes canais:';

  @override
  String footer_copyright(String year) {
    return '© $year Mauricifj. Todos os direitos reservados.';
  }
}
