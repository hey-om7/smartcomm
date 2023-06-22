import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.text,
    required this.color,
  });
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
                child: Center(
              child: myText(
                text: "ON",
                color: Colors.white,
                fontSize: 24,
                bold: FontWeight.bold,
              ),
            )),
            Container(
              height: 40,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}