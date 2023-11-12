import 'package:flutter/material.dart';

import '../../../../core/utilities/helpers/ui_helpers.dart';
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
      child: Column(
        children: [
          UiHelpers.attributeText("Humidity", humidity),
          const SizedBox(height: 6),
          UiHelpers.attributeText("Dew Point", dewPoint),
        ],
      ),
    );
  }
}
