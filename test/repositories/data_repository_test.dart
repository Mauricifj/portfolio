import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:portfolio/src/models/models.dart';
import 'package:portfolio/src/repositories/repositories.dart';

void main() {
  group('RemoteDataRepository', () {
    test('getExperiences returns list of experiences from remote', () async {
      final mockResponse = [
        {
          'company': 'Test Company',
          'role': {'en': 'Developer', 'pt': 'Desenvolvedor'},
          'startDate': '2023-01-01',
          'endDate': null,
          'description': {'en': 'Desc', 'pt': 'Desc'},
          'location': {'en': 'Remote', 'pt': 'Remoto'},
          'locationType': 'remote',
          'technologies': ['flutter'],
        },
      ];

      final client = MockClient((request) async {
        if (request.url.toString().contains('experience.json')) {
          return http.Response(json.encode(mockResponse), 200);
        }
        return http.Response('Not Found', 404);
      });

      final repository = RemoteDataRepository(client: client);
      final experiences = await repository.getExperiences('en');

      expect(experiences, isA<List<Experience>>());
      expect(experiences.length, 1);
      expect(experiences.first.company, 'Test Company');
      expect(experiences.first.role, 'Developer');
    });

    test('getProjects returns list of projects from remote', () async {
      final mockResponse = [
        {
          'title': {'en': 'Project A', 'pt': 'Projeto A'},
          'description': {'en': 'Desc', 'pt': 'Desc'},
          'technologies': ['dart'],
          'link': 'https://example.com',
        },
      ];

      final client = MockClient((request) async {
        if (request.url.toString().contains('projects.json')) {
          return http.Response(json.encode(mockResponse), 200);
        }
        return http.Response('Not Found', 404);
      });

      final repository = RemoteDataRepository(client: client);
      final projects = await repository.getProjects('en');

      expect(projects, isA<List<Project>>());
      expect(projects.length, 1);
      expect(projects.first.title, 'Project A');
    });

    test('getEducation returns list of education from remote', () async {
      final mockResponse = [
        {
          'institution': 'University',
          'degree': {'en': 'BS', 'pt': 'Bacharel'},
          'duration': '2020-2024',
          'description': {'en': 'Desc', 'pt': 'Desc'},
        },
      ];

      final client = MockClient((request) async {
        if (request.url.toString().contains('education.json')) {
          return http.Response(json.encode(mockResponse), 200);
        }
        return http.Response('Not Found', 404);
      });

      final repository = RemoteDataRepository(client: client);
      final education = await repository.getEducation('en');

      expect(education, isA<List<Education>>());
      expect(education.length, 1);
      expect(education.first.institution, 'University');
    });
  });
}
