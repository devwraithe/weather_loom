import 'package:flutter/material.dart';

class ErrorResponse extends StatelessWidget {
  final String title;
  final double? height;
  const ErrorResponse({
    Key? key,
    required this.title,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * height!,
      child: Center(
        child: Text(
          title,
          style: textTheme.subtitle2,
        ),
      ),
    );
  }
}
