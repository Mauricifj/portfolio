import 'package:flutter/material.dart';

import '../../design_system/design_system.dart';
import '../sections/sections.dart';

class SectionList extends StatelessWidget {
  final ScrollController scrollController;
  final List<GlobalKey> sectionKeys;

  const SectionList({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          AboutSection(key: sectionKeys[0]),
          Container(
            margin: const .only(top: AppSpacings.s80),
            child: ExperienceSection(key: sectionKeys[1]),
          ),
          Container(
            margin: const .only(top: AppSpacings.s80),
            child: EducationSection(key: sectionKeys[2]),
          ),
          Container(
            margin: const .only(top: AppSpacings.s80),
            child: ProjectsSection(key: sectionKeys[3]),
          ),
        ],
      ),
    );
  }
}
