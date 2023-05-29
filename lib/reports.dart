import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'package:smartcomm_pms_application/globalVals.dart';

class Reports extends StatelessWidget {
  const Reports({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: myText(
                  text: "Reports",
                  fontSize: 22,
                  bold: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          const ReportsCard(title: "Datatype"),
          const ReportsCard(
            title: "Template Group",
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                myText(
                  text: "From Date/Time",
                  color: Colors.white,
                  fontSize: 18,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 30,
                width: 135,
                decoration: BoxDecoration(
                  color: BasicValues.basicBlue2,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              // Spacer(),
              Container(
                height: 30,
                width: 135,
                decoration: BoxDecoration(
                  color: BasicValues.basicBlue2,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                myText(
                  text: "To Date/Time",
                  color: Colors.white,
                  fontSize: 18,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 30,
                width: 135,
                decoration: BoxDecoration(
                  color: BasicValues.basicBlue2,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              // Spacer(),
              Container(
                height: 30,
                width: 135,
                decoration: BoxDecoration(
                  color: BasicValues.basicBlue2,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              myButton(
                height: 50,
                width: 170,
                backgroundColor: Colors.transparent,
                text: "Preview",
                textSize: 18,
                border: Border.all(
                  width: 1,
                  color: const Color(0xffEB8A9C),
                ),
                borderRadius: 5,
              ),
              const myButton(
                height: 50,
                width: 170,
                backgroundColor: Color(0xffEB8A9C),
                text: "Save as PDF",
                borderRadius: 5,
                textSize: 18,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ReportsCard extends StatelessWidget {
  const ReportsCard({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: getDeviceWidth(context),
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9).withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          myText(
            text: title,
            color: Colors.white,
            fontSize: 18,
          ),
          const Spacer(),
          Image.asset(
            "assets/icon_arrow_down.png",
            width: 10,
            height: 10,
          ),
        ],
      ),
    );
  }
}
