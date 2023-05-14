import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smartcomm_pms_application/alarms.dart';
import 'package:smartcomm_pms_application/dashboardExplorer.dart';

import 'dashboard.dart';
import 'globalVals.dart';
import 'navbar.dart';
import 'navbar.dart' show activeIndex;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void refreshThisWidget() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          // height: 200,
          color: BasicValues.basicBlue,
          width: double.infinity,
          child: Center(
            child: Image.asset(
              BasicValues.smartCommLogoWhite,
              width: 100,
              // height: 50,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Navbar(
        refreshState: refreshThisWidget,
      ),
      backgroundColor: BasicValues.basicBlue3,
      body: [
        const DashboardStful(),
        const Alarms(),
        const DashboardExplorer(),
      ][activeIndex - 1],
    );
  }
}
