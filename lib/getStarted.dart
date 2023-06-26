// ignore_for_file: file_names

import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'package:smartcomm_pms_application/login_page.dart';
import 'globalVals.dart';

final ScrollController _controller = ScrollController();

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

bool keepanimating = true;
void _scrollDown() async {
  await _controller.animateTo(
    _controller.position.maxScrollExtent,
    duration: Duration(seconds: 4),
    curve: Curves.fastOutSlowIn,
  );
  await Future.delayed(Duration(seconds: 2), () {
    _controller.animateTo(_controller.position.minScrollExtent,
        duration: Duration(seconds: 1), curve: Curves.decelerate);
    printBlue("scrolling down");
    if (keepanimating) {
      _scrollDown();
    }
  });
}

class _GetStartedState extends State<GetStarted> {
  @override
  void initState() {
    // TODO: implement initState

    // _scrollDown();
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      _scrollDown();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    printWarning("activity disposed");
    keepanimating = false;
    super.dispose();
  }

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
                  Container(
                    // color: Colors.red,
                    child: SizedBox(
                      height: getDeviceHeight(context) * 0.5,
                      child: GridView.count(
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        // crossAxisSpacing: 200,
                        mainAxisSpacing: 20,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 40,
                            ),
                            child: Image.asset(
                              "assets/onetime_use/GetStarted/box1.png",
                              height: 60,
                              width: 220,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 40,
                            ),
                            child: Image.asset(
                              "assets/onetime_use/GetStarted/box2.png",
                              height: 40,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 40,
                            ),
                            child: Image.asset(
                              "assets/onetime_use/GetStarted/box3.png",
                              height: 40,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 40,
                            ),
                            child: Image.asset(
                              "assets/onetime_use/GetStarted/box4.png",
                              height: 40,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 40,
                            ),
                            child: Image.asset(
                              "assets/onetime_use/GetStarted/box5.png",
                              height: 40,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
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
                    const SizedBox(
                      height: 5,
                    )
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
