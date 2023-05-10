import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'package:smartcomm_pms_application/globalVals.dart';
import 'package:smartcomm_pms_application/navbar.dart';
import 'widgets/HistoricalTrends.dart';
import 'widgets/MultiValuedCard.dart';
import 'widgets/PieChartDonut.dart';
import 'widgets/SingleValueCard.dart';
import 'widgets/PhaseCard.dart';

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
    return Stack(
      children: [
        SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  shrinkWrap: true,
                  children: const [
                    PhasesCard(
                      color: Colors.red,
                      modetext: "Current (A)",
                      value: 2.57,
                      margin: EdgeInsets.all(10),
                    ),
                    PhasesCard(
                      color: Colors.red,
                      modetext: "Voltage (V)",
                      value: 2.57,
                      margin: EdgeInsets.all(10),
                    ),
                    PhasesCard(
                      color: Color(0xffFFAD08),
                      modetext: "Current (A)",
                      value: 2.57,
                      margin: EdgeInsets.all(10),
                    ),
                    PhasesCard(
                      color: Color(0xffFFAD08),
                      modetext: "Voltage (V)",
                      value: 2.57,
                      margin: EdgeInsets.all(10),
                    ),
                    PhasesCard(
                      color: Color(0xff71CBE0),
                      modetext: "Current (A)",
                      value: 2.57,
                      margin: EdgeInsets.all(10),
                    ),
                    PhasesCard(
                      color: Color(0xff71CBE0),
                      modetext: "Voltage (V)",
                      value: 2.57,
                      margin: EdgeInsets.all(10),
                    ),
                  ],
                ),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: const [
                    SingleValueCard(
                      title: "Frequency (Hz)",
                      value: 50.00,
                      margin: EdgeInsets.all(10),
                    ),
                    SingleValueCard(
                      title: "Power Factor",
                      value: 0.90,
                      margin: EdgeInsets.all(10),
                    ),
                  ],
                ),
                PrimaryBox(
                  width: getDeviceWidth(context),
                  height: 110,
                  margin: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: myText(
                          padding: EdgeInsets.all(8),
                          text: "Energy Data (kWh)",
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      Align(
                        child: SizedBox(
                          height: 70,
                          child: HistoricalTrends(
                            data: const [
                              10,
                              40,
                              20,
                              30,
                              50,
                              10,
                              50,
                              20,
                              40,
                              30
                            ],
                            maxValue: 50,
                            maxHeight: 70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    PieChartDonut(
                      title: "Active Power (kW)",
                      value: 59.55,
                    ),
                    PieChartDonut(
                      title: "Apparent Power (kVA)",
                      value: 59.55,
                    ),
                    PieChartDonut(
                      title: "Reactive Power (kVAr)",
                      value: 59.55,
                    ),
                  ],
                ),
                const MultivaluedCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
