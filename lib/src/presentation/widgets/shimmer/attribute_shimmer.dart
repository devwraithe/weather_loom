import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../config/theme/app_colors.dart';

class AttributeShimmer extends StatelessWidget {
  const AttributeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: AppColors.grey,
        highlightColor: AppColors.lightGray,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          height: 180,
        ),
      ),
    );
  }
}
