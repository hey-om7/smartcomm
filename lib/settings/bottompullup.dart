import 'package:essential_kit/essential_kit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../globalVals.dart';

XFile? profileImageAddress;

Future addCustomDetailsBottomPullup(context) async {
  final result = await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Material(
        color: Colors.transparent,
        child: Container(
          height: getDeviceHeight(context) * 0.2,
          decoration: BoxDecoration(
            color: BasicValues.basicBlue2,
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: getDeviceHeight(context) * 0.015),
                  child: Row(
                    children: [
                      const myText(
                        text: "Profile Photo",
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      Image.asset(
                        "assets/settings_profile/icon_delete.png",
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      ExtraOptionBlock(
                        title: "Camera",
                        imgPath: "assets/settings_profile/icon_camera.png",
                        ontap: () async {
                          final ImagePicker picker = ImagePicker();
                          profileImageAddress = await picker.pickImage(
                              source: ImageSource.camera);
                        },
                      ),
                      ExtraOptionBlock(
                        title: "Gallery",
                        imgPath: "assets/settings_profile/icon_gallery.png",
                        ontap: () async {
                          final ImagePicker picker = ImagePicker();
                          profileImageAddress = await picker.pickImage(
                              source: ImageSource.gallery);
                        },
                      ),
                      ExtraOptionBlock(
                        title: "Avatar",
                        imgPath: "assets/settings_profile/icon_avatar.png",
                        ontap: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

class ExtraOptionBlock extends StatelessWidget {
  const ExtraOptionBlock({
    super.key,
    required this.title,
    required this.imgPath,
    required this.ontap,
  });
  final String title;
  final String imgPath;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        ontap();
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 10,
            ),
            child: Image.asset(
              imgPath,
              width: 55,
              height: 55,
            ),
          ),
          myText(
            text: title,
            color: Colors.white,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
