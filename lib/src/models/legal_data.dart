import 'legal_page_content.dart';

class LegalData {
  final LegalPageContent privacyPolicy;
  final LegalPageContent termsOfUse;

  LegalData({required this.privacyPolicy, required this.termsOfUse});

  factory LegalData.fromJson(Map<String, dynamic> json, String languageCode) {
    return LegalData(
      privacyPolicy: .fromJson(json['privacy_policy'], languageCode),
      termsOfUse: .fromJson(json['terms_of_use'], languageCode),
    );
  }
}
