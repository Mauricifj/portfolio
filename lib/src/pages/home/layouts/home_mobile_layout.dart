import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../design_system/design_system.dart';
import '../../../providers/providers.dart';
import '../../sections/sections.dart';

class HomeMobileLayout extends ConsumerWidget {
  final ScrollController scrollController;
  final List<GlobalKey> sectionKeys;
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const HomeMobileLayout({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);
    final currentThemeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppAssets.appLogo, height: 32),
        actions: [
          LanguageSelector(
            currentLocale: currentLocale,
            onLocaleChanged: (locale) {
              ref.read(localeProvider.notifier).state = locale;
            },
          ),
          ThemeSelector(
            currentThemeMode: currentThemeMode,
            onThemeModeChanged: (mode) {
              ref.read(themeModeProvider.notifier).state = mode;
            },
          ),
          const SizedBox(width: AppSpacings.s8),
        ],
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(child: AboutSection(key: sectionKeys[0])),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacings.s80)),
          SliverToBoxAdapter(child: ExperienceSection(key: sectionKeys[1])),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacings.s80)),
          SliverToBoxAdapter(child: ProjectsSection(key: sectionKeys[2])),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacings.s80)),
          SliverToBoxAdapter(child: EducationSection(key: sectionKeys[3])),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacings.s80)),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: onDestinationSelected,
        selectedIndex: selectedIndex,
        labelBehavior: .onlyShowSelected,
        animationDuration: const Duration(milliseconds: 500),
        destinations: NavigationItems.getItems(context).map((item) {
          return NavigationDestination(
            icon: item.icon,
            selectedIcon: item.selectedIcon,
            label: item.label,
          );
        }).toList(),
      ),
    );
  }
}
