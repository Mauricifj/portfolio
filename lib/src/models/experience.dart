import '../utils/json_utils.dart';
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
    return Experience(
      company: json['company'] as String,
      role: getLocalized(json['role'], languageCode),
      startDate: .parse(json['startDate'] as String),
      endDate: json['endDate'] != null
          ? .parse(json['endDate'] as String)
          : null,
      description: getLocalized(json['description'], languageCode),
      location: getLocalized(json['location'], languageCode),
      locationType: .fromJson(json['locationType']),
      technologies: [
        for (final tech in json['technologies'] as List? ?? []) ...[
          Technology.fromJson(tech.toString()),
        ],
      ].where((t) => t != .unspecified).toList(),
    );
  }
}
