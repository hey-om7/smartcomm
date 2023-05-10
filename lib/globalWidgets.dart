// ignore_for_file: file_names

import 'package:flutter/widgets.dart';

import 'globalVals.dart';

class PrimaryBox extends StatelessWidget {
  const PrimaryBox({
    super.key,
    this.width,
    this.height,
    this.child,
    this.margin,
    this.padding,
  });

  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: BasicValues.basicBlue2,
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
