import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_system_ringtones/flutter_system_ringtones.dart';

import '../globalVals.dart';

class Ringtones extends StatefulWidget {
  const Ringtones({super.key});

  @override
  State<Ringtones> createState() => _RingtonesState();
}

class _RingtonesState extends State<Ringtones> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: myText(
                  text: "Ringtone & Vibration",
                  color: Colors.white,
                  fontSize: 18,
                  // bold: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: getDeviceWidth(context),
            color: BasicValues.basicBlue2,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const myText(
              text: "System Ringtones",
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: getDeviceWidth(context),
            color: BasicValues.basicBlue2,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: FutureBuilder(
                future: n1(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return SizedBox(
                      height: 200,
                      child: ListView(
                        children: [
                          ...List.generate(snapshot.data.length, (index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                children: [
                                  myText(
                                    text: snapshot.data[index],
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        )),
                                  )
                                ],
                              ),
                            );
                          })
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

Future n1() async {
  List l1 = [
    "None",
    "One Plus new feeling",
    "One Plus Tune",
    "Alacrity",
    "Alarm Clock"
  ];
  return l1;
}
