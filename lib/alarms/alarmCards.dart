import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';

import '../globalVals.dart';
import 'alarms.dart';

class AlarmCard extends StatefulWidget {
  const AlarmCard({
    super.key,
    required this.alarmmode,
    required this.priority,
    required this.value,
    required this.timestamp,
    required this.tagname,
    required this.ackstate,
    required this.acktime,
    required this.ackuser,
    required this.comments,
    required this.user,
    required this.wenttime,
    required this.description,
  });

  final String alarmmode;
  final int priority;
  final int value;
  final String timestamp;
  final String tagname;
  final String ackstate;
  final String acktime;
  final String ackuser;
  final String comments;
  final int user;
  final String wenttime;
  final String description;
  @override
  State<AlarmCard> createState() => _AlarmCardState();
}

class _AlarmCardState extends State<AlarmCard> {
  bool isOpened = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                color: getAlarmCardColor(widget.alarmmode),
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
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: getAlarmCardColor(widget.alarmmode),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: myText(
                        text: widget.value.toString(),
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
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: myText(
                        text: widget.timestamp,
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
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: myText(
                        text: widget.tagname,
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
                color: getAlarmCardColor(widget.alarmmode),
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const myText(
                              text: "Ack State",
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                // color: getAlarmCardColor(widget.alarmsmode),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: myText(
                                text: widget.ackstate,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const myText(
                              text: "Ack Time",
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: myText(
                                text: widget.acktime,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const myText(
                              text: "Comments",
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: myText(
                                text: widget.comments,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const myText(
                              text: "User",
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                // color: getAlarmCardColor(widget.alarmsmode),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: myText(
                                text: widget.ackuser,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const myText(
                              text: "Went Time",
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: myText(
                                text: widget.wenttime,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const myText(
                              text: "Description",
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const myText(
                                text: "-",
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
