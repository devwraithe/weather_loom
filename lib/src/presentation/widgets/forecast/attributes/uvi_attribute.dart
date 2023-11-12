import 'package:flutter/material.dart';

import '../../../../core/utilities/helpers/ui_helpers.dart';
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
      child: Column(
        children: [
          UiHelpers.attributeText(
            "Index",
            uvi,
          ),
        ],
      ),
    );
  }
}
