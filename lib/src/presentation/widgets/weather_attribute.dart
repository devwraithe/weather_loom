import 'package:flutter/material.dart';

class Attribute extends StatelessWidget {
  final String? value;
  final String? title;
  const Attribute({
    Key? key,
    this.value,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: textTheme.bodyText2?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value!,
            style: textTheme.headline6?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
