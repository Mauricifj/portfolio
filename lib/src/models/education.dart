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
    final degreeMap = json['degree'] as Map<String, dynamic>;
    final descriptionMap = json['description'] as Map<String, dynamic>;

    return Education(
      institution: json['institution'] as String,
      degree: degreeMap[languageCode] as String? ?? degreeMap['en'] as String,
      duration: json['duration'] as String,
      description:
          descriptionMap[languageCode] as String? ??
          descriptionMap['en'] as String,
    );
  }
}
