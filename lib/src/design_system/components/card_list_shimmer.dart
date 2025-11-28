import 'package:flutter/material.dart';

import '../design_system.dart';

class CardListShimmer extends StatelessWidget {
  final int count;
  final bool isDesktop;

  const CardListShimmer({super.key, this.count = 3, this.isDesktop = true});

  @override
  Widget build(BuildContext context) {
    if (isDesktop) {
      return Wrap(
        spacing: AppSpacings.s20,
        runSpacing: AppSpacings.s20,
        children: .generate(
          count,
          (index) => const CardShimmer(
            width: AppSizes.cardWidth,
            height: AppSizes.cardHeight,
          ),
        ),
      );
    }

    return Column(
      children: .generate(
        count,
        (index) => const Padding(
          padding: .only(bottom: AppSpacings.s20),
          child: CardShimmer(height: AppSizes.cardHeight),
        ),
      ),
    );
  }
}
