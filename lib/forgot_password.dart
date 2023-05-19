import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';

import 'globalVals.dart';
import 'homepage.dart';
import 'login_page.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

int selectedRadioButton = 1;

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                              text: "Forgot Email/Password",
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
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: myText(
                                text: "How would you like to reset password?",
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Radio(
                                        value: 1,
                                        groupValue: selectedRadioButton,
                                        activeColor: Colors.white,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedRadioButton = value!;
                                            print(selectedRadioButton);
                                          });
                                        }),
                                    const myText(
                                      text: "Email",
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    const Spacer(),
                                    Radio(
                                        value: 2,
                                        groupValue: selectedRadioButton,
                                        activeColor: Colors.white,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedRadioButton = value!;
                                            print(selectedRadioButton);
                                          });
                                        }),
                                    const myText(
                                      text: "Password",
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ]),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(20),
                              child: myText(
                                text:
                                    "We will send you an email to reset the password.",
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: selectedRadioButton == 1
                                  ? const input_cards(hinttext: "Email")
                                  : input_cards(
                                      hinttext: "Password",
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: myText(
                                              text: "+91",
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Image.asset(
                                            "assets/icon_arrow_down.png",
                                            width: 12,
                                            height: 12,
                                            // fit: BoxFit.fill,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            height: double.infinity,
                                            width: 1,
                                            color: Colors.white,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: myText(
                                              text: "9384938732",
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myButton(
                                text: selectedRadioButton == 1
                                    ? "Email me"
                                    : "Text me",
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
      ),
    );
  }
}
