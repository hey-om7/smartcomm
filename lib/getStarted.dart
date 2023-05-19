// ignore_for_file: file_names

import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'package:smartcomm_pms_application/login_page.dart';
import 'globalVals.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              BasicValues.smartCommBackground,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: BasicValues.basicBlue.withOpacity(0.4),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Image.asset(
                    // "assets/logo/smartcomm_bg.jpg",
                    "assets/logo/smartcomm_logo_white.png",
                    // height: 200,
                    width: getDeviceWidth(context) * 0.7,
                    height: getDeviceWidth(context) * 0.2,
                    // height: double.infinity,
                    // fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: getDeviceHeight(context) * 0.1,
                  ),
                  SizedBox(
                    height: getDeviceHeight(context) * 0.4,
                    child: GridView.count(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      // crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        Image.asset(
                          "assets/onetime_use/GetStarted/box1.png",
                          height: 40,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        Image.asset("assets/onetime_use/GetStarted/box2.png"),
                        Image.asset(
                          "assets/onetime_use/GetStarted/box1.png",
                          height: 40,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        Image.asset("assets/onetime_use/GetStarted/box2.png"),
                        Image.asset(
                          "assets/onetime_use/GetStarted/box1.png",
                          height: 40,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        Image.asset("assets/onetime_use/GetStarted/box2.png"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 125,
                width: getDeviceWidth(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    myButton(
                      height: 50,
                      width: getDeviceWidth(context) * 0.8,
                      padding: 0,
                      text: "Get Started",
                      borderRadius: 5,
                      backgroundColor:
                          const Color(0xffD9D9D9).withOpacity(0.50),
                      textSize: 20,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Image.asset(
                      BasicValues.electronicsAutomationLogoWhite,
                      width: 175,
                      height: 25,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
