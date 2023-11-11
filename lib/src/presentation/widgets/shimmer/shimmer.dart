import 'package:flutter/material.dart';
import 'package:open_weather/src/presentation/widgets/shimmer/hourly_shimmer.dart';

class Shimmer extends StatelessWidget {
  const Shimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HourlyShimmer(),
      ],
    );
  }
}
