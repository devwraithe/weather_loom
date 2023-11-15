import 'package:flutter/material.dart';
import 'package:open_weather/src/config/theme/app_text_theme.dart';

import 'attribute_container.dart';

class UviAttribute extends StatelessWidget {
  const UviAttribute({
    super.key,
    required this.loading,
    required this.uvi,
  });

  final bool loading;
  final num uvi;

  @override
  Widget build(BuildContext context) {
    return AttributeContainer(
      title: "UV INDEX",
      loading: loading,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              uvi.toString(),
              style: AppTextTheme.textTheme.headlineLarge,
            ),
            const SizedBox(height: 2),
            const Text("Low"),
            const SizedBox(height: 14),
            Text(uvi > 0 ? "----" : "--"),
          ],
        ),
      ),
    );
  }
}
