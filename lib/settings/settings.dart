import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'package:smartcomm_pms_application/globalVals.dart';
import 'package:smartcomm_pms_application/navbar.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: myText(
                  text: "Settings",
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SettingsTitle(
            title: "Profile",
          ),
          GestureDetector(
            onTap: () {
              activeIndex = 4;
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/profile-icon.png",
                    width: 45,
                    height: 45,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: myText(
                    text: "Edit Profile Settings",
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SettingsTitle(
            title: "Theme",
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: myText(
                  text: "Dark Mode",
                  color: Colors.white,
                  fontSize: 14,
                ),
              )
            ],
          ),
          const SettingsTitle(
            title: "Notification",
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: myText(
                  text: "Notifications",
                  color: Colors.white,
                  fontSize: 14,
                ),
              )
            ],
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: myText(
                  text: "Ringtone & Vibration",
                  color: Colors.white,
                  fontSize: 14,
                ),
              )
            ],
          ),
          const SettingsTitle(
            title: "Default Dashboard",
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: myText(
                  text: "Select Default Dashboard",
                  color: Colors.white,
                  fontSize: 14,
                ),
              )
            ],
          ),
          const SettingsTitle(
            title: "Membership",
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: myText(
                  text: "View Membership",
                  color: Colors.white,
                  fontSize: 14,
                ),
              )
            ],
          ),
          const SettingsTitle(
            title: "Privacy Setting",
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: myText(
                  text: "Privacy",
                  color: Colors.white,
                  fontSize: 14,
                ),
              )
            ],
          ),
          const SettingsTitle(
            title: "About Us",
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: myText(
                  text: "About Us",
                  color: Colors.white,
                  fontSize: 14,
                ),
              )
            ],
          ),
          myButton(
            height: 50,
            padding: 0,
            width: getDeviceWidth(context),
            text: "Logout",
            textSize: 18,
            backgroundColor: const Color(0xffEB8A9C).withOpacity(0.6),
            borderRadius: 0,
          )
        ],
      ),
    );
  }
}

class SettingsTitle extends StatelessWidget {
  const SettingsTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getDeviceWidth(context),
      color: BasicValues.basicBlue2,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: myText(
              text: title,
              color: const Color(0xffD9D9D9).withOpacity(0.5),
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}