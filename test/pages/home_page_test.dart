import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/src/design_system/design_system.dart';
import 'package:portfolio/src/pages/home_page.dart';
import 'package:portfolio/src/pages/sections/sections.dart';
import 'package:portfolio/src/providers/providers.dart';

void main() {
  testWidgets('HomePage renders all sections', (tester) async {
    // Set a desktop screen size to avoid overflow and ensure correct layout
    tester.view.physicalSize = const Size(1200, 1000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // Override providers with empty data to avoid network calls
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          experiencesProvider.overrideWith((ref) => []),
          projectsProvider.overrideWith((ref) => []),
          educationProvider.overrideWith((ref) => []),
        ],
        child: const PortfolioApp(),
      ),
    );

    // Wait for animations and async data
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(AboutSection), findsOneWidget);

    // Scroll to find other sections as they might be off-screen
    final scrollable = find.byType(Scrollable).first;

    await tester.scrollUntilVisible(
      find.byType(ExperienceSection),
      500.0,
      scrollable: scrollable,
    );
    expect(find.byType(ExperienceSection), findsOneWidget);

    await tester.scrollUntilVisible(
      find.byType(ProjectsSection),
      500.0,
      scrollable: scrollable,
    );
    expect(find.byType(ProjectsSection), findsOneWidget);

    await tester.scrollUntilVisible(
      find.byType(EducationSection),
      500.0,
      scrollable: scrollable,
    );
    expect(find.byType(EducationSection), findsOneWidget);
  });

  testWidgets('HomePage changes locale', (tester) async {
    tester.view.physicalSize = const Size(1200, 1000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          experiencesProvider.overrideWith((ref) => []),
          projectsProvider.overrideWith((ref) => []),
          educationProvider.overrideWith((ref) => []),
        ],
        child: const PortfolioApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify initial locale (English) - AboutSection shows "Hello, I'm"
    expect(find.text("Hello, I'm"), findsOneWidget);

    // Find language selector and tap it to open the menu
    final languageSelector = find.byType(LanguageSelector);
    expect(languageSelector, findsOneWidget);
    await tester.tap(languageSelector);
    await tester.pumpAndSettle();

    // Find the Portuguese option and tap it
    final portugueseOption = find.text('Português');
    expect(portugueseOption, findsOneWidget);
    await tester.tap(portugueseOption);
    await tester.pumpAndSettle();

    // Verify locale changed to Portuguese - AboutSection shows "Olá, eu sou"
    expect(find.text('Olá, eu sou'), findsOneWidget);
  });
}
