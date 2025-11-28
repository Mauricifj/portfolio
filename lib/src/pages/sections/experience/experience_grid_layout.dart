import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';

import '../../../design_system/design_system.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/models.dart';
import 'experience_card_fit_content.dart';

class ExperienceGridLayout extends StatelessWidget {
  final List<Experience> experiences;
  final DateFormat dateFormat;
  final AppLanguage appLanguage;
  final AppLocalizations l10n;
  final int columnCount;

  const ExperienceGridLayout({
    super.key,
    required this.experiences,
    required this.dateFormat,
    required this.appLanguage,
    required this.l10n,
    required this.columnCount,
  });

  @override
  Widget build(BuildContext context) {
    final columns = List.generate(columnCount, (_) => <Widget>[]);

    for (var i = 0; i < experiences.length; i++) {
      final exp = experiences[i];
      final start = dateFormat.format(exp.startDate);
      final end = exp.endDate != null
          ? dateFormat.format(exp.endDate!)
          : l10n.common_present;
      final duration = '$start - $end';

      final card = Padding(
        padding: const .only(bottom: AppSpacings.s20),
        child: ExperienceCardFitContent(
          title: exp.role,
          subtitle: exp.company,
          duration: duration,
          description: exp.description,
          location: exp.location,
          locationType: exp.locationType,
          technologies: exp.technologies,
          language: appLanguage,
        ),
      ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2);

      columns[i % columnCount].add(card);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: columns.map((columnCards) {
        return Expanded(
          child: Padding(
            padding: const .symmetric(horizontal: AppSpacings.s8),
            child: Column(children: columnCards),
          ),
        );
      }).toList(),
    );
  }
}
