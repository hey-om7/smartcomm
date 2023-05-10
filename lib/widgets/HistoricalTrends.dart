// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HistoricalTrends extends StatelessWidget {
  final List<double> data;
  final double maxValue;
  final double maxHeight;

  HistoricalTrends({
    required this.data,
    required this.maxValue,
    required this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(
        data.length,
        (index) => Container(
          margin: const EdgeInsets.all(4),
          height: maxHeight * (data[index] / maxValue),
          width: 10,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.7),
                const Color(0xffD2E9FF),
                const Color(0xffB6DBFF).withOpacity(0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
