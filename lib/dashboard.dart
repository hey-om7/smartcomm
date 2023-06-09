import 'dart:convert';

import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'package:smartcomm_pms_application/globalVals.dart';
import 'package:smartcomm_pms_application/widgets/Indicator.dart';
import 'widgets/HistoricalTrends.dart';
import 'widgets/MultiValuedCard.dart';
import 'widgets/PieChartDonut.dart';
import 'widgets/SingleValueCard.dart';
import 'widgets/PhaseCard.dart';

import 'package:http/http.dart' as http;

// class Dashboard extends StatelessWidget {
//   const Dashboard({
//     super.key,
//     required this.refreshState,
//   });
//   final Function refreshState;

//   @override
//   Widget build(BuildContext context) {
//     return const DashboardStful();
//   }
// }

class DashboardStful extends StatefulWidget {
  const DashboardStful({
    super.key,
  });

  @override
  State<DashboardStful> createState() => _DashboardStfulState();
}

class _DashboardStfulState extends State<DashboardStful> {
  @override
  Widget build(BuildContext context) {
    passingDashboardName = "DriveSoftStarter";
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: FutureBuilder(
            future: getDashboardData(passingDashboardName),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Wrap(
                  children: [
                    SingleValueCard(
                      title: "title",
                      value: 10,
                      margin: EdgeInsets.all(10),
                    ),
                    SingleValueCard(
                      title: "title",
                      value: 10,
                      margin: EdgeInsets.all(10),
                    ),
                    SingleValueCard(
                      title: "title",
                      value: 10,
                      margin: EdgeInsets.all(10),
                    ),
                    PhasesCard(
                        modetext: "modetext", value: 20, color: Colors.amber),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PieChartDonut(
                        title: "title",
                        value: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PieChartDonut(
                        title: "title",
                        value: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PieChartDonut(
                        title: "title",
                        value: 10,
                      ),
                    ),
                    Indicator(text: "ON", color: Colors.amber),
                    Indicator(text: "TRIP", color: Colors.red),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

class DashboardStructure {
  final String message;
  final List dashboards;

  const DashboardStructure({
    required this.message,
    required this.dashboards,
  });

  factory DashboardStructure.fromJson(Map<String, dynamic> json) {
    return DashboardStructure(
      message: json['message'],
      dashboards: json['dashboards'],
    );
  }
}

Future getDashboardData(String name) async {
  final response = await http.get(Uri.parse(
      "${BasicValues.publicIp}/dashboarddetails?dashboardname=$passingDashboardName"));
  if (response.statusCode == 200) {
    var n1 = DashboardStructure.fromJson(jsonDecode(response.body));
    printBlue("dashboard message is:${n1.message}");
  }
  return "";
}

// Column(
//             children: [
//               Container(
//                 height: 30,
//                 width: getDeviceWidth(context),
//                 color: BasicValues.basicBlue2,
//                 alignment: Alignment.centerLeft,
//                 padding: const EdgeInsets.only(left: 10),
//                 child: const myText(
//                   text:
//                       "Dashboard >> Deviceview >> Meters >> WC4410 >> WC4410Dashboard",
//                   fontSize: 10,
//                   color: Colors.white,
//                 ),
//               ),
//               const Divider(
//                 color: Colors.white,
//                 thickness: 0.5,
//                 height: 0,
//               ),
//               GridView.count(
//                 physics: const NeverScrollableScrollPhysics(),
//                 crossAxisCount: 2,
//                 childAspectRatio: 3,
//                 shrinkWrap: true,
//                 children: const [
//                   PhasesCard(
//                     color: Colors.red,
//                     modetext: "Current (A)",
//                     value: 2.57,
//                     margin: EdgeInsets.all(10),
//                   ),
//                   PhasesCard(
//                     color: Colors.red,
//                     modetext: "Voltage (V)",
//                     value: 2.57,
//                     margin: EdgeInsets.all(10),
//                   ),
//                   PhasesCard(
//                     color: Color(0xffFFAD08),
//                     modetext: "Current (A)",
//                     value: 2.57,
//                     margin: EdgeInsets.all(10),
//                   ),
//                   PhasesCard(
//                     color: Color(0xffFFAD08),
//                     modetext: "Voltage (V)",
//                     value: 2.57,
//                     margin: EdgeInsets.all(10),
//                   ),
//                   PhasesCard(
//                     color: Color(0xff71CBE0),
//                     modetext: "Current (A)",
//                     value: 2.57,
//                     margin: EdgeInsets.all(10),
//                   ),
//                   PhasesCard(
//                     color: Color(0xff71CBE0),
//                     modetext: "Voltage (V)",
//                     value: 2.57,
//                     margin: EdgeInsets.all(10),
//                   ),
//                 ],
//               ),
//               GridView.count(
//                 physics: const NeverScrollableScrollPhysics(),
//                 crossAxisCount: 2,
//                 shrinkWrap: true,
//                 children: const [
//                   SingleValueCard(
//                     title: "Frequency (Hz)",
//                     value: 50.00,
//                     margin: EdgeInsets.all(10),
//                   ),
//                   SingleValueCard(
//                     title: "Power Factor",
//                     value: 0.90,
//                     margin: EdgeInsets.all(10),
//                   ),
//                 ],
//               ),
//               PrimaryBox(
//                 width: getDeviceWidth(context),
//                 height: 110,
//                 margin: const EdgeInsets.all(10),
//                 child: Stack(
//                   children: [
//                     const Align(
//                       alignment: Alignment.topLeft,
//                       child: myText(
//                         padding: EdgeInsets.all(8),
//                         text: "Energy Data (kWh)",
//                         color: Colors.white,
//                         fontSize: 10,
//                       ),
//                     ),
//                     Align(
//                       child: SizedBox(
//                         height: 70,
//                         child: HistoricalTrends(
//                           data: const [10, 40, 20, 30, 50, 10, 50, 20, 40, 30],
//                           maxValue: 50,
//                           maxHeight: 70,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   PieChartDonut(
//                     title: "Active Power (kW)",
//                     value: 59.55,
//                   ),
//                   PieChartDonut(
//                     title: "Apparent Power (kVA)",
//                     value: 59.55,
//                   ),
//                   PieChartDonut(
//                     title: "Reactive Power (kVAr)",
//                     value: 59.55,
//                   ),
//                 ],
//               ),
//               const MultivaluedCard(),
//             ],
//           ),