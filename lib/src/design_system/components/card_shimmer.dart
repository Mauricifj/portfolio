import 'package:flutter/material.dart';

import '../design_system.dart';

class CardShimmer extends StatefulWidget {
  final double? width;
  final double? height;

  const CardShimmer({super.key, this.width, this.height});

  @override
  State<CardShimmer> createState() => _CardShimmerState();
}

class _CardShimmerState extends State<CardShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: AppAnimations.long, vsync: this)
      ..repeat();

    _animation =
        Tween<double>(
          begin: AppAnimations.shimmerBegin,
          end: AppAnimations.shimmerEnd,
        ).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == .dark;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Card(
        elevation: AppElevations.card,
        shape: RoundedRectangleBorder(
          borderRadius: .circular(AppSizes.cardRadius),
        ),
        child: ClipRRect(
          borderRadius: .circular(AppSizes.cardRadius),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: .centerLeft,
                    end: .centerRight,
                    colors: isDark
                        ? [
                            AppColors.shimmerDarkBase,
                            AppColors.shimmerDarkHighlight,
                            AppColors.shimmerDarkBase,
                          ]
                        : [
                            AppColors.shimmerLightBase,
                            AppColors.shimmerLightHighlight,
                            AppColors.shimmerLightBase,
                          ],
                    stops: [
                      _animation.value - AppAnimations.shimmerStop,
                      _animation.value,
                      _animation.value + AppAnimations.shimmerStop,
                    ].map((e) => e.clamp(0.0, 1.0)).toList(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
