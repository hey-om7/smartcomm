import 'dart:convert';

import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'package:smartcomm_pms_application/forgot_password.dart';
import 'package:smartcomm_pms_application/homepage.dart';
import 'globalVals.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BasicValues.basicBlue2,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              BasicValues.smartCommBackground,
              height: getDeviceHeight(context),
              width: getDeviceWidth(context),
              fit: BoxFit.cover,
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: LoginPageStful(),
            ),
          ),
        ],
      ),
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
    final TextEditingController usernameTextController =
        TextEditingController();
    final TextEditingController passwordTextController =
        TextEditingController();
    return Container(
      height: getDeviceHeight(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            BasicValues.smartCommLogoWhite,
            width: getDeviceWidth(context) * 0.7,
            height: getDeviceWidth(context) * 0.2,
          ),
          SizedBox(
            height: getDeviceHeight(context) * 0.12,
          ),

          Container(
            height: 400,
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
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    color: Colors.white.withOpacity(0.8),
                    height: 2,
                    thickness: 2,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                input_cards(
                  hinttext: "Username",
                  imgpath: "assets/login/account_profile.png",
                  textEditingController: usernameTextController,
                ),
                input_cards(
                  hinttext: "Password",
                  ispassword: true,
                  imgpath: 'assets/login/icon_eye.png',
                  textEditingController: passwordTextController,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPassword()));
                        },
                        child: const myText(
                          text: "Forgot Password?",
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ischecking_req
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : myButton(
                          text: "LOGIN",
                          textSize: 18,
                          backgroundColor: BasicValues.gray2.withOpacity(0.6),
                          borderRadius: 5,
                          onPress: () {
                            ischecking_req = true;
                            setState(() {});
                            // checkValidityUser("Super_User", "Super@123456")
                            checkValidityUser(usernameTextController.text,
                                    passwordTextController.text)
                                .then((value) {
                              if (value == true) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePage()));
                              } else {
                                ischecking_req = false;
                                setState(() {});
                                toastMessagePopup(
                                    context, "Invalid Credentials");
                              }
                            });
                          },
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    toastMessagePopup(context,
                        "This feature will be available in the future update");
                  },
                  child: const Padding(
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
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 125,
          // ),
          const Spacer(),
          Image.asset(
            "assets/logo/EAlogowhite.png",
            height: 40,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

Future checkValidityUser(String username, String password) async {
  // Super@12345
  // Super_User

  final response = await http.get(Uri.parse(
      'http://10.189.118.85:4000/login?user=$username&pass=$password'));
  if (response.statusCode == 200) {
    var n1 = LoginCreds.fromJson(jsonDecode(response.body));
    if (n1.status == 1) {
      printBlue("auth successful");
      return true;
    }
  } else {
    printError("Error fetching request, HTTP CODE:${response.statusCode}");
  }
  printBlue("auth not success");
  return false;
}

bool isPasswordHidden = true;

class LoginCreds {
  final int status;
  final String message;
  const LoginCreds({
    required this.status,
    required this.message,
  });

  factory LoginCreds.fromJson(Map<String, dynamic> json) {
    return LoginCreds(
      status: json['status'],
      message: json['message'],
    );
  }
}

// ignore: camel_case_types
class input_cards extends StatelessWidget {
  const input_cards({
    super.key,
    required this.hinttext,
    this.ispassword,
    this.child,
    required this.imgpath,
    required this.textEditingController,
  });
  final String hinttext;
  final bool? ispassword;
  final Widget? child;
  final String imgpath;
  final TextEditingController textEditingController;

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
          // width: double.infinity,
          height: 20,
          child: Row(
            children: [
              Expanded(
                child: child ??
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextFormField(
                        controller: textEditingController,
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
              Image.asset(
                imgpath,
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 15,
              ),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

bool ischecking_req = false;
