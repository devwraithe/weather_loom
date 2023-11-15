import 'package:flutter/material.dart';

import '../../../../core/utilities/helpers/ui_helpers.dart';
import 'attribute_container.dart';

class PressureAttribute extends StatelessWidget {
  const PressureAttribute({
    super.key,
    required this.loading,
    required this.pressure,
  });

  final bool loading;
  final num pressure;

  @override
  Widget build(BuildContext context) {
    return AttributeContainer(
      title: "PRESSURE",
      loading: loading,
      child: Column(
        children: [
          UiHelpers.attributeText(
            "Pressure",
            pressure,
          ),
        ],
      ),
    );
  }
}
