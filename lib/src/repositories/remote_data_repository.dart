import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../config/app_config.dart';
import '../models/models.dart';
import 'data_repository.dart';

class RemoteDataRepository implements DataRepository {
  final http.Client _client;

  RemoteDataRepository({http.Client? client})
    : _client = client ?? http.Client();

  @override
  Future<List<Experience>> getExperiences(String languageCode) async {
    try {
      final uri = Uri.parse('${AppConfig.dataUrl}/experience.json');
      final response = await _client.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data
            .map((json) => Experience.fromJson(json, languageCode))
            .toList();
      }
    } on Exception catch (error, stackTrace) {
      _logError(error, stackTrace);
    }

    final jsonString = await rootBundle.loadString(
      'assets/data/experience.json',
    );
    final List<dynamic> data = json.decode(jsonString);
    return data.map((json) => Experience.fromJson(json, languageCode)).toList();
  }

  @override
  Future<List<Project>> getProjects(String languageCode) async {
    try {
      final uri = Uri.parse('${AppConfig.dataUrl}/projects.json');
      final response = await _client.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data
            .map((json) => Project.fromJson(json, languageCode))
            .toList();
      }
    } on Exception catch (error, stackTrace) {
      _logError(error, stackTrace);
    }

    final jsonString = await rootBundle.loadString('assets/data/projects.json');
    final List<dynamic> data = json.decode(jsonString);
    return data.map((json) => Project.fromJson(json, languageCode)).toList();
  }

  @override
  Future<List<Education>> getEducation(String languageCode) async {
    try {
      final uri = Uri.parse('${AppConfig.dataUrl}/education.json');
      final response = await _client.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data
            .map((json) => Education.fromJson(json, languageCode))
            .toList();
      }
    } on Exception catch (error, stackTrace) {
      _logError(error, stackTrace);
    }

    final jsonString = await rootBundle.loadString(
      'assets/data/education.json',
    );
    final List<dynamic> data = json.decode(jsonString);
    return data.map((json) => Education.fromJson(json, languageCode)).toList();
  }
  void _logError(Object error, StackTrace stackTrace) {
    debugPrint('Failed to load remote data: $error');
    debugPrint('Stack trace: $stackTrace');
  }
}
