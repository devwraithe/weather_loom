import 'package:flutter/material.dart';

import '../../../config/theme/app_text_theme.dart';
import '../../../core/utilities/constants.dart';

class OverviewLoading extends StatelessWidget {
  const OverviewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    const textTheme = AppTextTheme.textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 60, top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Constants.listIcon,
          const SizedBox(height: 52),
          Text(
            "--",
            style: textTheme.displayLarge,
          ),
        ],
      ),
    );
  }
}
