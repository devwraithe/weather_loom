import 'package:flutter/material.dart';
import 'package:open_weather/src/core/utilities/helpers/convert_timestamp.dart';

import '../../../../core/utilities/helpers/ui_helpers.dart';
import 'attribute_container.dart';

class SunsetAttribute extends StatelessWidget {
  const SunsetAttribute({
    super.key,
    required this.loading,
    required this.sunset,
    required this.sunrise,
    required this.timezone,
  });

  final bool loading;
  final num sunset, sunrise;
  final String timezone;

  @override
  Widget build(BuildContext context) {
    return AttributeContainer(
      title: "SUNSET",
      loading: loading,
      child: Column(
        children: [
          UiHelpers.attributeText(
            "Sunrise",
            convertTimestamp(
              sunrise.toInt(),
              timeZone: timezone,
            ),
          ),
          const SizedBox(height: 6),
          UiHelpers.attributeText(
            "Sunset",
            convertTimestamp(
              sunset.toInt(),
              timeZone: timezone,
            ),
          ),
        ],
      ),
    );
  }
}
