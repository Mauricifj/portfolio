import '../utils/json_utils.dart';

class LegalSection {
  final String content;

  LegalSection({required this.content});

  factory LegalSection.fromJson(
    Map<String, dynamic> json,
    String languageCode,
  ) {
    return LegalSection(content: getLocalized(json['content'], languageCode));
  }
}
