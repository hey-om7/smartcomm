import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';

import '../globalWidgets.dart';

class MultivaluedCard extends StatelessWidget {
  const MultivaluedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryBox(
      height: 100,
      width: getDeviceWidth(context) / 2,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ListView(
        shrinkWrap: true,
        children: const [
          myText(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
            text: "Recieved Energy",
            fontSize: 10,
            color: Colors.white,
          ),
          MultivaluedCardValues(
            title: "Active (kWh)",
            value: 8259.22,
          ),
          MultivaluedCardValues(
            title: "Apparent (kVAh)",
            value: 8259.22,
          ),
          MultivaluedCardValues(
            title: "Reactive Lead (kVArh)",
            value: 8259.22,
          ),
          MultivaluedCardValues(
            title: "Reactive Lag (kVArh)",
            value: 8259.22,
          ),
        ],
      ),
    );
  }
}

class MultivaluedCardValues extends StatelessWidget {
  const MultivaluedCardValues({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        myText(
          padding: const EdgeInsets.all(3),
          text: title,
          fontSize: 9,
          color: Colors.white,
        ),
        const Spacer(),
        myText(
          padding: const EdgeInsets.all(3),
          text: value.toString(),
          fontSize: 9,
          color: Colors.white,
        ),
      ],
    );
  }
}
