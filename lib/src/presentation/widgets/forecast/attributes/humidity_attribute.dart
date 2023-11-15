import 'package:flutter/material.dart';

import '../../../../config/theme/app_text_theme.dart';
import 'attribute_container.dart';

class HumidityAttribute extends StatelessWidget {
  const HumidityAttribute({
    super.key,
    required this.loading,
    required this.humidity,
    required this.dewPoint,
  });

  final bool loading;
  final num humidity, dewPoint;

  @override
  Widget build(BuildContext context) {
    return AttributeContainer(
      title: "HUMIDITY",
      loading: loading,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${humidity.toString()}%",
              style: AppTextTheme.textTheme.headlineLarge,
            ),
            const Spacer(),
            Text("The dew point is $dewPoint% right now."),
          ],
        ),
      ),
    );
  }
}
