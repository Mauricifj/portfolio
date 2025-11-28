import 'app_language.dart';

enum Technology {
  flutter,
  dart,
  apiRest,
  gcp,
  tdd,
  agile,
  git,
  e2e,
  cicd,
  ux,
  android,
  ios,
  flutterWeb,
  php,
  csharp,
  js,
  kotlin,
  docker,
  azure,
  kubernetes,
  tensorFlow,
  imageClassification,
  objectDetection,
  web,
  mobile,
  cleanArchitecture,
  apiIntegration,
  nodejs,
  unspecified;

  static Technology fromJson(String? value) {
    return values.firstWhere((e) => e.name == value, orElse: () => unspecified);
  }

  String displayName(AppLanguage language) {
    switch (this) {
      case apiRest:
        return 'API Rest';
      case flutter:
        return 'Flutter';
      case dart:
        return 'Dart';
      case gcp:
        return 'GCP';
      case tdd:
        return 'TDD';
      case agile:
        return 'Agile';
      case git:
        return 'Git';
      case e2e:
        return 'E2E';
      case cicd:
        return 'CI/CD';
      case ux:
        return 'UX';
      case android:
        return 'Android';
      case ios:
        return 'iOS';
      case flutterWeb:
        return 'Flutter Web';
      case php:
        return 'PHP';
      case csharp:
        return 'C#';
      case js:
        return 'JS';
      case kotlin:
        return 'Kotlin';
      case docker:
        return 'Docker';
      case azure:
        return 'Azure';
      case kubernetes:
        return 'Kubernetes';
      case tensorFlow:
        return 'TensorFlow';
      case imageClassification:
        switch (language) {
          case .pt:
            return 'Classificação de Imagem';
          case .es:
            return 'Clasificación de Imagen';
          case .fr:
            return 'Clasification d\'image';
          case .de:
            return 'Bildklassifikation';
          default:
            return 'Image classification';
        }
      case objectDetection:
        switch (language) {
          case .pt:
            return 'Detecção de Objetos';
          case .es:
            return 'Clasificación de Objetos';
          case .fr:
            return 'Clasification d\'objet';
          case .de:
            return 'Objekterkennung';
          default:
            return 'Object Detection';
        }
      case web:
        return 'Web';
      case mobile:
        return 'Mobile';
      case cleanArchitecture:
        switch (language) {
          case .pt:
            return 'Arquitetura Limpa';
          case .es:
            return 'Arquitectura Limpia';
          case .fr:
            return 'Architecture propre';
          case .de:
            return 'Architektur sauber';
          default:
            return 'Clean Architecture';
        }
      case apiIntegration:
        switch (language) {
          case .pt:
            return 'Integração de API';
          case .es:
            return 'Integración de API';
          case .fr:
            return 'Intégration API';
          case .de:
            return 'API-Integration';
          default:
            return 'API Integration';
        }
      case nodejs:
        return 'Node.js';
      case unspecified:
        return '';
    }
  }
}
