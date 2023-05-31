import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'package:smartcomm_pms_application/globalVals.dart';
import 'settingsProfile.dart' show editprofilenametest, editprofilenameimgtest;

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
          GestureDetector(
            onTap: () {},
            child: Container(
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
                    editprofilenameimgtest,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  // myText(
                  //   text: editprofilenametest,
                  //   color: Colors.white,
                  //   fontSize: 14,
                  // ),
                  Expanded(
                    child: TextFormField(
                      initialValue: editprofilenametest,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: 10)),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // const Spacer(),
                  Image.asset(
                    "assets/icon_edit.png",
                    width: 15,
                    height: 15,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
