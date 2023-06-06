import 'dart:convert';

import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'alarmCards.dart';
import 'package:http/http.dart' as http;

import 'classes.dart';

class Alarms extends StatelessWidget {
  const Alarms({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SeverityCard(title: "Severe", color: Color(0XFFC42126)),
                SeverityCard(title: "Alarm", color: Color(0xffC46F21)),
                SeverityCard(title: "Warning", color: Color(0xffF4D62A)),
                SeverityCard(
                    title: "Information",
                    color: Color(0xff199710),
                    imagePath: "assets/icons/icon_tick.png"),
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 9, horizontal: 20),
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
              child: FutureBuilder(
                  future: getAlarmsDatafromJson(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          // AlarmCard(alarmsmode: AlarmsMode.Alarm),
                          // AlarmCard(alarmsmode: AlarmsMode.Severe),
                          // AlarmCard(alarmsmode: AlarmsMode.Warning),
                          // AlarmCard(alarmsmode: AlarmsMode.Information),

                          ...List.generate(snapshot.data.length, (index) {
                            var thisData = snapshot.data[index];
                            return AlarmCard(
                              alarmmode: thisData['alarm_shortsign'],
                              priority: int.parse(thisData['priority']),
                              value: thisData['value'] == ""
                                  ? "-"
                                  : thisData['value'],
                              timestamp: thisData['time_stamp'] == ""
                                  ? "-"
                                  : thisData['time_stamp'],
                              tagname: thisData["tagname"] == ""
                                  ? "-"
                                  : thisData["tagname"],
                              ackstate: thisData['ack_state'] == ""
                                  ? "-"
                                  : thisData['ack_state'],
                              acktime: thisData['ack_timestamp'] == ""
                                  ? "-"
                                  : thisData['ack_timestamp'],
                              ackuser: thisData['ack_user'] == ""
                                  ? "-"
                                  : thisData['ack_user'],
                              comments: thisData['user_comments'] == ""
                                  ? "-"
                                  : thisData['user_comments'],
                              user: 1234,
                              wenttime: thisData['wenttimestamp'] == ""
                                  ? "-"
                                  : thisData['wenttimestamp'],
                              description: thisData['description'] == ""
                                  ? "-"
                                  : thisData['wenttimestamp'],
                            );
                          }),
                        ],
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

Future getAlarmsDatafromJson() async {
  final response = await http.get(
      Uri.parse('http://10.189.118.85:4000/alarmdata?alarmdatatype=Active'));

  if (response.statusCode == 200) {
    // printBlue(response.body);
    // var tagObjsJson = jsonDecode(response.body);

    // printWarning(tagObjsJson.toString());
    // var tagObjs = tagObjsJson.map((tagJson) => Ele.fromJson(tagJson)).toList();
    var n1 = AlarmsJsonResponseStr.fromJson(jsonDecode(response.body));
    return n1.alarmElements;
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

Color getAlarmCardColor(String alarmsMode) {
  if (alarmsMode == "Severe") {
    return const Color(0xffC42126);
  }
  if (alarmsMode == "Alarm") {
    return const Color(0xffC46F21);
  }
  if (alarmsMode == "Warning") {
    return const Color(0xffF4D62A);
  }
  if (alarmsMode == "Information") {
    return const Color(0xff199710);
  }
  return const Color(0xffffffff);
  // if (alarmsMode == AlarmsMode.Severe) {
  //   return const Color(0xffC42126);
  // }
  // if (alarmsMode == AlarmsMode.Alarm) {
  //   return const Color(0xffC46F21);
  // }
  // if (alarmsMode == AlarmsMode.Warning) {
  //   return const Color(0xffF4D62A);
  // }
  // if (alarmsMode == AlarmsMode.Information) {
  //   return const Color(0xff199710);
  // }
  // return const Color(0xffffffff);
}

/*
This Widget function takes in input as follows:
1.)alarmsmode: An enum that takes input from the following as Severe, Alarm, Warning, Information
                and returns the respective colours of the border and as well as the background.
2.)value: The value of that particualr alarm card instance.
3.)title: The title of that particualr alarm card instance.
 */
// class AlarmCardInfo {
//   final int priority;
//   final int value;
//   final String timestamp;
//   final String tagname;
//   final String ackstate;
//   final String acktime;
//   final String comments;
//   final int user;
//   final String wenttime;
//   final String description;
//   const AlarmCardInfo({
//     required this.priority,
//     required this.value,
//     required this.timestamp,
//     required this.tagname,
//     required this.ackstate,
//     required this.acktime,
//     required this.comments,
//     required this.user,
//     required this.wenttime,
//     required this.description,
//   });

//   factory AlarmCardInfo.fromJson(Map<String, dynamic> json) {
//     return AlarmCardInfo(
//       priority: json['priority'],
//       value: json['value'],
//       timestamp: json['time_stamp'],
//       tagname: json['tagname'],
//       ackstate: json['ack_state'],
//       acktime: json['ack_timestamp'],
//       comments: json['comments'],
//       user: json['ack_user'],
//       wenttime: json['wenttimestamp'],
//       description: json['description'],
//     );
//   }
// }
