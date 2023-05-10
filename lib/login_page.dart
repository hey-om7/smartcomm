import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'package:smartcomm_pms_application/dashboard.dart';
import 'package:smartcomm_pms_application/homepage.dart';

import 'globalVals.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BasicValues.basicBlue2,
      body: const LoginPageStful(),
    );
  }
}

class LoginPageStful extends StatefulWidget {
  const LoginPageStful({super.key});

  @override
  State<LoginPageStful> createState() => _LoginPageStfulState();
}

class _LoginPageStfulState extends State<LoginPageStful> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: getDeviceHeight(context),
        width: getDeviceWidth(context),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                BasicValues.smartCommBackground,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/logo/smartcomm_logo_white.png",
                      width: getDeviceWidth(context) * 0.7,
                      height: getDeviceWidth(context) * 0.2,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: getDeviceHeight(context) * 0.5,
                      width: getDeviceWidth(context) * 0.95,
                      decoration: BoxDecoration(
                        color: BasicValues.basicBlue2.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const myText(
                            padding: EdgeInsets.only(top: 20),
                            text: "Welcome",
                            color: Colors.white,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Divider(
                              color: Colors.white.withOpacity(0.8),
                              height: 2,
                              thickness: 2,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const input_cards(hinttext: "Username"),
                          const input_cards(
                              hinttext: "Password", ispassword: true),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                myText(
                                  text: "Forgot Password?",
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: myButton(
                              text: "LOGIN",
                              textSize: 18,
                              backgroundColor:
                                  BasicValues.gray2.withOpacity(0.6),
                              borderRadius: 5,
                              onPress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePage()));
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "New to Smartcomm? Sign up Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            // child: myText(
                            //   text: "New to Smartcomm? Sign up Now",
                            //   fontSize: 18,
                            //   color: Colors.white,
                            // ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        "assets/logo/EAlogowhite.png",
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class input_cards extends StatelessWidget {
  const input_cards({
    super.key,
    required this.hinttext,
    this.ispassword,
  });
  final String hinttext;
  final bool? ispassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: getDeviceWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: BasicValues.gray1.withOpacity(0.5),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 20,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextFormField(
                    obscureText: ispassword ?? false,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hinttext,
                        hintStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal)),
                  ),
                ),
              ),

              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
