import 'package:flutter/material.dart';

import '../breakpoints.dart';
import '../spacings.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry padding;
  final bool fillHeight;

  const SectionContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding = const .all(AppSpacings.s60),
    this.fillHeight = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = Breakpoints.isDesktop(constraints.maxWidth);
        final isTablet = Breakpoints.isTablet(constraints.maxWidth);
        final hasInfiniteHeight = constraints.maxHeight == .infinity;

        EdgeInsetsGeometry responsivePadding;
        if (isDesktop) {
          responsivePadding = padding;
        } else if (isTablet) {
          responsivePadding = const .all(AppSpacings.s40);
        } else {
          responsivePadding = const .symmetric(
            horizontal: AppSpacings.s24,
            vertical: AppSpacings.s20,
          );
        }

        return Container(
          color: backgroundColor,
          padding: responsivePadding,
          width: .infinity,
          height: fillHeight && !hasInfiniteHeight ? .infinity : null,
          child: Align(
            alignment: .center,
            heightFactor: hasInfiniteHeight ? 1.0 : null,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
