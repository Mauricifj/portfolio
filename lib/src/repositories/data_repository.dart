import '../models/models.dart';

abstract class DataRepository {
  Future<List<Experience>> getExperiences(String languageCode);
  Future<List<Project>> getProjects(String languageCode);
  Future<List<Education>> getEducation(String languageCode);
  Future<LegalData> getLegalData(String languageCode);
  Future<SupportContent> getSupportData(String languageCode);
}
