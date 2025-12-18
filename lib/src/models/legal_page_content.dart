import '../utils/json_utils.dart';
import 'legal_section.dart';

class LegalPageContent {
  final String date;
  final List<LegalSection> sections;

  LegalPageContent({required this.date, required this.sections});

  factory LegalPageContent.fromJson(
    Map<String, dynamic> json,
    String languageCode,
  ) {
    return LegalPageContent(
      date: getLocalized(json['date'], languageCode),
      sections: (json['sections'] as List)
          .map((e) => LegalSection.fromJson(e, languageCode))
          .toList(),
    );
  }
}
