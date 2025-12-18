import '../utils/json_utils.dart';
import 'technology.dart';

class Project {
  final String title;
  final String description;
  final List<Technology> technologies;
  final String link;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.link,
  });

  factory Project.fromJson(Map<String, dynamic> json, String languageCode) {
    return Project(
      title: getLocalized(json['title'], languageCode),
      description: getLocalized(json['description'], languageCode),
      technologies: [
        for (final tech in json['technologies'] as List? ?? []) ...[
          Technology.fromJson(tech.toString()),
        ],
      ].where((t) => t != .unspecified).toList(),
      link: json['link'] as String,
    );
  }
}
