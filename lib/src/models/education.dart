import '../utils/json_utils.dart';

class Education {
  final String institution;
  final String degree;
  final String duration;
  final String description;

  const Education({
    required this.institution,
    required this.degree,
    required this.duration,
    required this.description,
  });

  factory Education.fromJson(Map<String, dynamic> json, String languageCode) {
    return Education(
      institution: json['institution'] as String,
      degree: getLocalized(json['degree'], languageCode),
      duration: json['duration'] as String,
      description: getLocalized(json['description'], languageCode),
    );
  }
}
