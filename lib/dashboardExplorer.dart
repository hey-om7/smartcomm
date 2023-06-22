import 'dart:convert';

import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smartcomm_pms_application/globalVals.dart';
import 'homepage.dart';
import 'login_page.dart' as loginpage;
import 'testing_json.dart' as tjson;

String activeName = "";
Map<String, dynamic> jsonData = jsonDecode(tjson.jsonString);
List<dynamic> childList = jsonData["pantview"]["Dashboard"];
// List<dynamic> childList = jsonData["pantview"]["SLD"];

class DashboardExplorer extends StatefulWidget {
  const DashboardExplorer({super.key});

  @override
  State<DashboardExplorer> createState() => _DashboardExplorerState();
}

List containsDirectories = [];

class _DashboardExplorerState extends State<DashboardExplorer> {
  @override
  Widget build(BuildContext context) {
    // printBlue("h1");
    // print(loginpage.plantView);

    return Scaffold(
      backgroundColor: BasicValues.basicBlue3,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const HomePage(),
            //       ),
            //     );
            //   },
            //   child: DashboardExploreCard(
            //     title: "Plant View",
            //   ),
            // ),
            // DashboardExploreCard(
            //   title: "Device View",
            // ),
            GestureDetector(
              onTap: () {
                if (containsDirectories.isNotEmpty) {
                  var _n1 = containsDirectories.removeLast();
                  childList = _n1;
                  setState(() {});
                }
              },
              child: const myText(
                text: "< Back",
                color: Colors.white,
                fontSize: 20,
                bold: FontWeight.bold,
                padding: EdgeInsets.only(bottom: 20),
              ),
            ),
            ...List.generate(
              childList.length,
              (index) => GestureDetector(
                onTap: () {
                  // printBlue(childList.toString());
                  // printWarning(childList[index]["child"].toString());
                  containsDirectories.add(childList);
                  childList = childList[index]["child"];
                  printWarning(childList[index]["panelname"].toString());

                  setState(() {});
                },
                child: DashboardExploreCard(
                  title: childList[index]["parent"],
                  innerClick: () {
                    printBlue("inside button");
                    var panelName = childList[index]["panelname"];
                    if (panelName != null) {
                      printWarning("non null");
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardExploreCard extends StatelessWidget {
  const DashboardExploreCard({
    super.key,
    required this.title,
    required this.innerClick,
  });
  final String title;
  final VoidCallback innerClick;

  @override
  Widget build(BuildContext context) {
    return PrimaryBox(
      margin: const EdgeInsets.only(bottom: 10),
      width: getDeviceWidth(context),
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shadow: true,
      child: Row(
        children: [
          myText(
            text: title,
            fontSize: 14,
            color: Colors.white,
          ),
          const Spacer(),
          RotatedBox(
            quarterTurns: 3,
            child: GestureDetector(
              onTap: () {
                innerClick();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                color: Colors.transparent,
                child: Image.asset(
                  "assets/down_arrow.png",
                  width: 13,
                  height: 13,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
