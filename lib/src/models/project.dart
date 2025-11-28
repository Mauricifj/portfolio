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
    final titleMap = json['title'] as Map<String, dynamic>;
    final descriptionMap = json['description'] as Map<String, dynamic>;

    return Project(
      title: titleMap[languageCode] as String? ?? titleMap['en'] as String,
      description:
          descriptionMap[languageCode] as String? ??
          descriptionMap['en'] as String,
      technologies: [
        for (final tech in json['technologies'] as List? ?? [])
          Technology.fromJson(tech.toString()),
      ].where((t) => t != .unspecified).toList(),
      link: json['link'] as String,
    );
  }
}
