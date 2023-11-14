import 'package:flutter/material.dart';

import 'attribute_shimmer.dart';

class AttributesShimmer extends StatefulWidget {
  const AttributesShimmer({super.key});

  @override
  State<AttributesShimmer> createState() => _AttributesShimmerState();
}

class _AttributesShimmerState extends State<AttributesShimmer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      child: const Column(
        children: [
          Row(
            children: [
              AttributeShimmer(),
              SizedBox(width: 18),
              AttributeShimmer(),
            ],
          ),
          SizedBox(height: 18),
          Row(
            children: [
              AttributeShimmer(),
              SizedBox(width: 18),
              AttributeShimmer(),
            ],
          ),
          SizedBox(height: 18),
          Row(
            children: [
              AttributeShimmer(),
              SizedBox(width: 18),
              AttributeShimmer(),
            ],
          ),
        ],
      ),
    );
  }
}
