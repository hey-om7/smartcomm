import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'package:smartcomm_pms_application/globalVals.dart';

class Alarms extends StatelessWidget {
  const Alarms({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SeverityCard(title: "Severe", color: Color(0XFFC42126)),
              SeverityCard(title: "Alarm", color: Color(0xffC46F21)),
              SeverityCard(title: "Warning", color: Color(0xffF4D62A)),
              SeverityCard(
                title: "Information",
                color: Color(0xff199710),
                imagePath: "assets/icons/icon_tick.png",
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: const [
              SizedBox(
                height: 25,
              ),
              AlarmCard(alarmsmode: AlarmsMode.Alarm),
              AlarmCard(alarmsmode: AlarmsMode.Severe),
              AlarmCard(alarmsmode: AlarmsMode.Warning),
              AlarmCard(alarmsmode: AlarmsMode.Information),
              AlarmCard(alarmsmode: AlarmsMode.Severe),
            ],
          ),
        ),
      ],
    );
  }
}

class SeverityCard extends StatelessWidget {
  const SeverityCard({
    super.key,
    required this.title,
    required this.color,
    this.imagePath,
  });
  final String title;
  final Color color;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imagePath ?? "assets/icons/icon_warning.png",
          width: 15,
          height: 15,
          color: color,
        ),
        const SizedBox(
          width: 5,
        ),
        myText(
          text: title,
          color: Colors.white,
          fontSize: 14,
        ),
      ],
    );
  }
}

// ignore: constant_identifier_names
enum AlarmsMode { Severe, Alarm, Warning, Information }

Color getAlarmCardColor(AlarmsMode alarmsMode) {
  if (alarmsMode == AlarmsMode.Severe) {
    return const Color(0xffC42126);
  }
  if (alarmsMode == AlarmsMode.Alarm) {
    return const Color(0xffC46F21);
  }
  if (alarmsMode == AlarmsMode.Warning) {
    return const Color(0xffF4D62A);
  }
  if (alarmsMode == AlarmsMode.Information) {
    return const Color(0xff199710);
  }
  return const Color(0xffffffff);
}

/*
This Widget function takes in input as follows:
1.)alarmsmode: An enum that takes input from the following as Severe, Alarm, Warning, Information
                and returns the respective colours of the border and as well as the background.
2.)value: The value of that particualr alarm card instance.
3.)title: The title of that particualr alarm card instance.
 */
class AlarmCard extends StatelessWidget {
  const AlarmCard({
    super.key,
    required this.alarmsmode,
  });

  final AlarmsMode alarmsmode;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: getDeviceWidth(context),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: BasicValues.basicBlue2,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 1,
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(5, 5),
          ),
        ],
        border: Border.all(
          color: getAlarmCardColor(alarmsmode),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const myText(
                text: "Value",
                fontSize: 10,
                color: Colors.white,
              ),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: getAlarmCardColor(alarmsmode),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const myText(
                  text: "80",
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const myText(
                text: "Time Stamp",
                fontSize: 10,
                color: Colors.white,
              ),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const myText(
                  text: "2023-03-17  15:04:59",
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const myText(
                text: "Tag Name",
                fontSize: 10,
                color: Colors.white,
              ),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const myText(
                  text: "Meter_4410.MX.V_LL.RY",
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
