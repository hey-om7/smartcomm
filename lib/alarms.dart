import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'package:smartcomm_pms_application/globalVals.dart';

class Alarms extends StatelessWidget {
  const Alarms({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
          Container(
            margin: const EdgeInsets.all(10),
            height: 30,
            width: getDeviceWidth(context),
            decoration: BoxDecoration(
              color: const Color(0xffD9D9D9).withOpacity(0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      // contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  "assets/icon_filter.png",
                  width: 20,
                  height: 20,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: const [
                  AlarmCard(alarmsmode: AlarmsMode.Alarm),
                  AlarmCard(alarmsmode: AlarmsMode.Severe),
                  AlarmCard(alarmsmode: AlarmsMode.Warning),
                  AlarmCard(alarmsmode: AlarmsMode.Information),
                  AlarmCard(alarmsmode: AlarmsMode.Severe),
                ],
              ),
            ),
          ),
        ],
      ),
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
class AlarmCard extends StatefulWidget {
  const AlarmCard({
    super.key,
    required this.alarmsmode,
  });

  final AlarmsMode alarmsmode;
  @override
  State<AlarmCard> createState() => _AlarmCardState();
}

class _AlarmCardState extends State<AlarmCard> {
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            isOpened = !isOpened;
            setState(() {});
          },
          child: Container(
            height: 55,
            width: getDeviceWidth(context),
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
                color: getAlarmCardColor(widget.alarmsmode),
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
                        color: getAlarmCardColor(widget.alarmsmode),
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
                Image.asset(
                  "assets/icon_arrow_down.png",
                  width: 10,
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isOpened,
          child: Container(
            height: 110,
            width: getDeviceWidth(context),
            decoration: BoxDecoration(
              color: BasicValues.basicBlue2,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 1,
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(5, 5),
                ),
              ],
              border: Border.all(
                color: getAlarmCardColor(widget.alarmsmode),
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
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
                            // color: getAlarmCardColor(widget.alarmsmode),
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
                Row(
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
                            // color: getAlarmCardColor(widget.alarmsmode),
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
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
