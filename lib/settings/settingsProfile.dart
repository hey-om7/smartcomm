import 'dart:io';

import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'package:smartcomm_pms_application/globalVals.dart';
import 'package:smartcomm_pms_application/settings/bottompullup.dart';

class SettingsProfile extends StatefulWidget {
  const SettingsProfile({super.key});

  @override
  State<SettingsProfile> createState() => _SettingsProfileState();
}

class _SettingsProfileState extends State<SettingsProfile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: myText(
                  text: "Edit Profile",
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          profileImageAddress == null
              ? Image.asset(
                  "assets/profile-icon.png",
                  height: 120,
                  width: 120,
                  fit: BoxFit.fill,
                )
              : Image.file(
                  File(profileImageAddress!.path),
                  width: 120,
                  height: 120,
                ),
          const SizedBox(
            height: 10,
          ),
          const myText(
            text: "Michael Jonathan",
            color: Colors.white,
            fontSize: 14,
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              addCustomDetailsBottomPullup(context).then((value) {
                printBlue("refreshing with profile pic");
                setState(() {});
              });
            },
            child: const myText(
              text: "Upload Photo",
              color: Color(0xff4BD2D2),
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          SettingsProfilePageCard(
            title: "Change Username",
            imagePath: "assets/settings_profile/icon_profile.png",
            ontap: () {},
          ),
          SettingsProfilePageCard(
            title: "Change Password",
            imagePath: "assets/settings_profile/icon_password.png",
            ontap: () {},
          ),
          SettingsProfilePageCard(
            title: "Change Email",
            imagePath: "assets/settings_profile/icon_email.png",
            ontap: () {},
          ),
          SettingsProfilePageCard(
            title: "Change Mobile No.",
            imagePath: "assets/settings_profile/icon_phone.png",
            ontap: () {},
          ),
          SettingsProfilePageCard(
            title: "Change Language",
            imagePath: "assets/settings_profile/icon_language.png",
            ontap: () {},
          ),
        ],
      ),
    );
  }
}

class SettingsProfilePageCard extends StatelessWidget {
  const SettingsProfilePageCard({
    super.key,
    required this.title,
    required this.ontap,
    required this.imagePath,
  });
  final String title;
  final Function ontap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getDeviceWidth(context),
      margin: const EdgeInsets.all(10),
      height: 35,
      decoration: BoxDecoration(
        color: BasicValues.basicBlue2,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 12,
          ),
          Image.asset(
            imagePath,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 20,
          ),
          myText(
            text: title,
            color: Colors.white,
            fontSize: 14,
          ),
          const Spacer(),
          Image.asset(
            "assets/settings_profile/right_arrow.png",
            width: 10,
            height: 10,
          ),
        ],
      ),
    );
  }
}
