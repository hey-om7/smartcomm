import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';

import '../globalVals.dart';

class PhasesCard extends StatelessWidget {
  const PhasesCard({
    super.key,
    required this.modetext,
    required this.value,
    required this.color,
    this.margin,
  });
  final String modetext;
  final double value;
  final Color color;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PrimaryBox(
        height: 40,
        width: getDeviceWidth(context) / 2,
        margin: margin,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    "assets/widgets/single-value/single-value-card-icon-red.png",
                    height: 30,
                    width: 30,
                    color: color,
                  ),
                ),
                myText(
                  text: modetext,
                  color: Colors.white,
                  fontSize: 14,
                ),
                Spacer(),
                myText(
                  text: value.toString(),
                  fontSize: 16,
                  bold: FontWeight.bold,
                  color: color,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
