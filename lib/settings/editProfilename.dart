import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartcomm_pms_application/globalVals.dart';

bool isdarkmode = true;
bool isnotificationsactive = false;

class EditProfileName extends StatefulWidget {
  const EditProfileName({super.key, required this.refreshParent});
  final Function() refreshParent;
  @override
  State<EditProfileName> createState() => _EditProfileNameState();
}

class _EditProfileNameState extends State<EditProfileName> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          Row(
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
          SettingsTitle(
            title: "Profile",
          ),
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
