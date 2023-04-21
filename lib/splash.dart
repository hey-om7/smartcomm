import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:smartcomm_pms_application/getStarted.dart';
import 'package:smartcomm_pms_application/globalVals.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => GetStarted()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            child: Image.asset(
              "assets/smartcomm_bg.jpg",
              height: double.infinity,
              fit: BoxFit.cover,
            ),
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
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Image.asset(
              // "assets/smartcomm_bg.jpg",
              "assets/smartcomm_logo_white.png",
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
