import 'package:flutter/material.dart';

import '../../models/location_type.dart';
import '../colors.dart';

extension LocationTypeColorExtension on LocationType {
  Color get color {
    switch (this) {
      case .remote:
        return AppColors.badgeRemote;
      case .hybrid:
        return AppColors.badgeHybrid;
      case .onsite:
        return AppColors.badgeOnsite;
      case .unspecified:
        return Colors.transparent;
    }
  }
}
