import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartcomm_pms_application/globalVals.dart';
import 'package:smartcomm_pms_application/navbar.dart';

bool isdarkmode = true;
bool isnotificationsactive = false;

class Settings extends StatefulWidget {
  const Settings({super.key, required this.refreshParent});
  final Function() refreshParent;
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
              activeIndex = 5;
              widget.refreshParent();
              // isSettingsProfilePage = true;
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
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: myText(
                  text: "Dark Mode",
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              CupertinoSwitch(
                activeColor: BasicValues.basicBlue2,
                value: isdarkmode,
                onChanged: (value) {
                  setState(() {
                    isdarkmode = !isdarkmode;
                  });
                },
              )
            ],
          ),
          const SettingsTitle(
            title: "Notification",
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: myText(
                  text: "Notifications",
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              CupertinoSwitch(
                activeColor: BasicValues.basicBlue2,
                trackColor: BasicValues.basicBlue2.withOpacity(0.5),
                value: isnotificationsactive,
                onChanged: (value) {
                  setState(() {
                    isnotificationsactive = !isnotificationsactive;
                  });
                },
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
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
              ),
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
            onPress: () {
              Navigator.pop(context);
            },
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
