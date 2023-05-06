import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';

import '../globalVals.dart';

class SingleValueCard extends StatelessWidget {
  const SingleValueCard({
    super.key,
    required this.title,
    required this.value,
    this.margin,
  });
  final String title;
  final double value;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PrimaryBox(
        height: 90,
        width: getDeviceWidth(context) / 2,
        margin: margin,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: myText(
                  text: title,
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: myText(
                text: value.toString(),
                color: Colors.white,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
