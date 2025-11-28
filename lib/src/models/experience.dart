import 'location_type.dart';
import 'technology.dart';

class Experience {
  final String company;
  final String role;
  final DateTime startDate;
  final DateTime? endDate;
  final String description;
  final String location;
  final LocationType locationType;
  final List<Technology> technologies;

  Experience({
    required this.company,
    required this.role,
    required this.startDate,
    this.endDate,
    required this.description,
    required this.location,
    required this.locationType,
    required this.technologies,
  });

  factory Experience.fromJson(Map<String, dynamic> json, String languageCode) {
    final roleMap = json['role'] as Map<String, dynamic>;
    final descriptionMap = json['description'] as Map<String, dynamic>;
    final locationMap = json['location'] as Map<String, dynamic>;

    return Experience(
      company: json['company'] as String,
      role: roleMap[languageCode] as String? ?? roleMap['en'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'] as String)
          : null,
      description:
          descriptionMap[languageCode] as String? ??
          descriptionMap['en'] as String,
      location:
          locationMap[languageCode] as String? ?? locationMap['en'] as String,
      locationType: LocationType.fromJson(json['locationType']),
      technologies: [
        for (final tech in json['technologies'] as List? ?? [])
          Technology.fromJson(tech.toString()),
      ].where((t) => t != .unspecified).toList(),
    );
  }
}
