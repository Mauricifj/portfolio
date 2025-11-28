import 'package:flutter/material.dart';

import '../design_system.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.size,
    required this.errorIconSize,
  });

  final double size;
  final double errorIconSize;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: size,
        height: size,
        color: AppColors.surfaceNeutral,
        child: Image.asset(
          AppAssets.profileImage,
          fit: .cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: errorIconSize * 2,
              height: errorIconSize * 2,
              decoration: const BoxDecoration(
                color: AppColors.surfaceNeutralSubtle,
                shape: .circle,
              ),
              child: Icon(
                Icons.person,
                size: errorIconSize,
                color: AppColors.iconNeutral,
              ),
            );
          },
        ),
      ),
    );
  }
}
