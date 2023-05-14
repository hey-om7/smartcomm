import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smartcomm_pms_application/globalVals.dart';

class DashboardExplorer extends StatelessWidget {
  const DashboardExplorer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: const [
          DashboardExploreCard(
            title: "Plant View",
          ),
          DashboardExploreCard(
            title: "Device View",
          ),
        ],
      ),
    );
  }
}

class DashboardExploreCard extends StatelessWidget {
  const DashboardExploreCard({
    super.key,
    required this.title,
  });
  final String title;

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
          Spacer(),
          Image.asset(
            "assets/down_arrow.png",
            width: 13,
            height: 13,
          )
        ],
      ),
    );
  }
}
