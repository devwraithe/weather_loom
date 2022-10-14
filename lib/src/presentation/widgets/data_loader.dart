import 'package:flutter/cupertino.dart';

class DataLoader extends StatelessWidget {
  final double? height;
  const DataLoader({
    Key? key,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * height!,
      child: const Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
