import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import 'package:smartcomm_pms_application/getStarted.dart';
import 'package:smartcomm_pms_application/globalVals.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SplashScreenStful(),
    );
  }
}

class SplashScreenStful extends StatefulWidget {
  const SplashScreenStful({super.key});

  @override
  State<SplashScreenStful> createState() => _SplashScreenStfulState();
}

class _SplashScreenStfulState extends State<SplashScreenStful> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const GetStarted()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/smartcomm_bg.jpg",
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // child: SvgPicture.asset(
          //   "assets/smartcomm_bg_img.svg",
          //   semanticsLabel: 'Acme Logo',
          // ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: BasicValues.basicBlue.withOpacity(0.4),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Image.asset(
              // "assets/logo/smartcomm_bg.jpg",
              "assets/logo/smartcomm_logo_white.png",
              // height: 200,
              width: double.infinity,
              // height: double.infinity,
              // fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
