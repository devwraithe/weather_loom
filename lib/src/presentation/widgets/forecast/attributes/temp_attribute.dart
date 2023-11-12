import 'package:flutter/material.dart';

import '../../../../core/utilities/helpers/ui_helpers.dart';
import 'attribute_container.dart';

class TempAttribute extends StatelessWidget {
  const TempAttribute({
    super.key,
    required this.loading,
    required this.feelsLike,
    required this.humidity,
  });

  final bool loading;
  final num feelsLike, humidity;

  @override
  Widget build(BuildContext context) {
    return AttributeContainer(
      title: "TEMP",
      loading: loading,
      child: Column(
        children: [
          UiHelpers.attributeText("Feels like", feelsLike),
          const SizedBox(height: 6),
          UiHelpers.attributeText("Humidity", humidity),
        ],
      ),
    );
  }
}
