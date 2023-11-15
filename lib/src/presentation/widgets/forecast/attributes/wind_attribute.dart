import 'package:flutter/material.dart';
import 'package:open_weather/src/core/utilities/helpers/ui_helpers.dart';

import 'attribute_container.dart';

class WindAttribute extends StatelessWidget {
  const WindAttribute({
    super.key,
    required this.loading,
    required this.speed,
    required this.gust,
  });

  final bool loading;
  final num speed, gust;

  @override
  Widget build(BuildContext context) {
    return AttributeContainer(
      title: "WIND",
      loading: loading,
      child: Column(
        children: [
          UiHelpers.attributeText("Speed", speed),
          const SizedBox(height: 6),
          UiHelpers.attributeText(
            "Gust",
            gust == 0 ? "N/A" : gust,
          ),
        ],
      ),
    );
  }
}
