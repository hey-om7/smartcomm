import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smartcomm_pms_application/alarms/alarms.dart';
import 'package:smartcomm_pms_application/reports.dart';
import 'package:smartcomm_pms_application/settings/editProfilename.dart';
import 'package:smartcomm_pms_application/settings/ringtones.dart';
import 'package:smartcomm_pms_application/settings/settings.dart';
import 'package:smartcomm_pms_application/settings/settingsProfile.dart';

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
    printBlue("refreshed homepage");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        // ),
        bottomNavigationBar: Navbar(
          refreshState: refreshThisWidget,
        ),
        backgroundColor: BasicValues.basicBlue3,
        body: Column(
          children: [
            Container(
              height: 40,
              color: BasicValues.basicBlue,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset(
                    BasicValues.smartCommLogoWhite,
                    width: 150,
                    height: 35,
                    fit: BoxFit.fill,
                  ),
                  const Spacer(),
                  Image.asset(
                    "assets/profile-icon.png",
                    width: 25,
                    height: 25,
                  ),
                ],
              ),
            ),
            [
              const DashboardStful(),
              const Alarms(),
              // const DashboardExplorer(),
              const Reports(),
              Settings(refreshParent: refreshThisWidget),
              SettingsProfile(refreshParent: refreshThisWidget),
              EditProfileName(refreshParent: refreshThisWidget),
              Ringtones(),
            ][activeIndex - 1],
          ],
        ));
  }
}
