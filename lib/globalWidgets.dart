// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'globalVals.dart';

/*
Basic Box used as the background holder which acts as a parent and holds children with the common
property of the Primarybox.

Width,Height,Margin,Padding,Shadow,Child are the properties that it supports
 */
class PrimaryBox extends StatelessWidget {
  const PrimaryBox({
    super.key,
    this.width,
    this.height,
    this.child,
    this.margin,
    this.padding,
    this.shadow,
  });

  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool? shadow;

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
        boxShadow: shadow != null
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  offset: const Offset(3, 3),
                  blurRadius: 3,
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}
