import 'package:flutter/material.dart';

class AttributesCard extends StatelessWidget {
  final String? value;
  final String? title;
  const AttributesCard({
    Key? key,
    this.value,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      width: 162,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 3),
            Text(
              title ?? "",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              value ?? "",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
