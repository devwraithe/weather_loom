import 'package:flutter/material.dart';
import 'package:open_weather/src/config/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class OverviewShimmer extends StatelessWidget {
  const OverviewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey,
      highlightColor: AppColors.lightGray,
      child: Container(
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.symmetric(horizontal: 18),
        height: 1700,
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
