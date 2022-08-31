import 'package:flutter/material.dart';

class DefaultResult extends StatelessWidget {
  final String? response;
  final String? icon;
  const DefaultResult({
    Key? key,
    this.response,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.62,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon ?? "assets/images/error.png",
              width: 160,
            ),
            Text(
              response ?? "Unavalable",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
