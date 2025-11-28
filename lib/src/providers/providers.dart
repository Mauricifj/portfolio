import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';

class LocaleNotifier extends Notifier<Locale> {
  @override
  Locale build() => const Locale('en');

  @override
  set state(Locale value) => super.state = value;
}

final localeProvider = NotifierProvider<LocaleNotifier, Locale>(
  LocaleNotifier.new,
);

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => .system;

  @override
  set state(ThemeMode value) => super.state = value;
}

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

final dataRepositoryProvider = Provider<DataRepository>((ref) {
  return RemoteDataRepository();
});

final experiencesProvider = FutureProvider<List<Experience>>((ref) async {
  final repository = ref.watch(dataRepositoryProvider);
  final locale = ref.watch(localeProvider);
  return repository.getExperiences(locale.languageCode);
});

final projectsProvider = FutureProvider<List<Project>>((ref) async {
  final repository = ref.watch(dataRepositoryProvider);
  final locale = ref.watch(localeProvider);
  return repository.getProjects(locale.languageCode);
});

final educationProvider = FutureProvider<List<Education>>((ref) async {
  final repository = ref.watch(dataRepositoryProvider);
  final locale = ref.watch(localeProvider);
  return repository.getEducation(locale.languageCode);
});
