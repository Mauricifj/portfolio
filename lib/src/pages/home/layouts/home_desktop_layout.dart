import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../design_system/design_system.dart';
import '../../../providers/providers.dart';
import '../../sections/sections.dart';

class HomeDesktopLayout extends ConsumerWidget {
  final ScrollController scrollController;
  final List<GlobalKey> sectionKeys;
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const HomeDesktopLayout({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentLocale = ref.watch(localeProvider);
    final currentThemeMode = ref.watch(themeModeProvider);

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: .all,
            groupAlignment: 0.0,
            backgroundColor: theme.colorScheme.surfaceContainer,
            indicatorColor: theme.colorScheme.primaryContainer,
            leading: Padding(
              padding: const .symmetric(vertical: AppSpacings.s20),
              child: Image.asset(AppAssets.appLogo, height: AppSizes.iconLarge),
            ),
            trailing: Expanded(
              child: Column(
                mainAxisAlignment: .end,
                children: [
                  LanguageSelector(
                    currentLocale: currentLocale,
                    onLocaleChanged: (locale) {
                      ref.read(localeProvider.notifier).state = locale;
                    },
                  ),
                  const SizedBox(height: AppSpacings.s10),
                  ThemeSelector(
                    currentThemeMode: currentThemeMode,
                    onThemeModeChanged: (mode) {
                      ref.read(themeModeProvider.notifier).state = mode;
                    },
                  ),
                  const SizedBox(height: AppSpacings.s20),
                ],
              ),
            ),
            destinations: NavigationItems.getItems(context).map((item) {
              return NavigationRailDestination(
                icon: item.icon,
                selectedIcon: item.selectedIcon,
                label: Text(item.label),
              );
            }).toList(),
          ),
          Expanded(
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const .symmetric(horizontal: AppSpacings.s40),
                    child: AboutSection(key: sectionKeys[0]),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: AppSpacings.s80),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const .symmetric(horizontal: AppSpacings.s40),
                    child: ExperienceSection(key: sectionKeys[1]),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: AppSpacings.s80),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const .symmetric(horizontal: AppSpacings.s40),
                    child: ProjectsSection(key: sectionKeys[2]),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: AppSpacings.s80),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const .symmetric(horizontal: AppSpacings.s40),
                    child: EducationSection(key: sectionKeys[3]),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: AppSpacings.s80),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
