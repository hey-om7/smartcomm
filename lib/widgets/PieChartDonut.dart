import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';

import '../globalVals.dart';

class PieChartDonut extends StatelessWidget {
  const PieChartDonut({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final double value;

  @override
  Widget build(BuildContext context) {
    return PrimaryBox(
      height: 100,
      width: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          myText(
            text: title,
            fontSize: 7,
            color: Colors.white,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2.0,
                    color: BasicValues.green,
                  )),
              child: Center(
                child: myText(
                  text: value.toString(),
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
