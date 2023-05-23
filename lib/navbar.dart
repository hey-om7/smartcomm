import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smartcomm_pms_application/globalVals.dart';

int activeIndex = 1;

class Navbar extends StatefulWidget {
  const Navbar({
    super.key,
    // required this.activeIndex,
    required this.refreshState,
  });
  final Function refreshState;
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  void refreshThis() {
    setState(() {});
    widget.refreshState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(
        bottom: 10,
      ),
      width: double.infinity,
      // color: Colors.orange,
      color: BasicValues.basicBlue,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavbarWidgets(
              active: activeIndex == 1,
              img_path: "assets/navbar/icon_1.png",
              refreshCallback: refreshThis,
              widgetIndex: 1,
            ),
            NavbarWidgets(
              active: activeIndex == 2,
              img_path: "assets/navbar/icon_2.png",
              refreshCallback: refreshThis,
              widgetIndex: 2,
            ),
            NavbarWidgets(
              active: activeIndex == 3,
              img_path: "assets/navbar/icon_3.png",
              refreshCallback: refreshThis,
              widgetIndex: 3,
            ),
            NavbarWidgets(
              active: activeIndex == 4,
              img_path: "assets/navbar/icon_4.png",
              refreshCallback: refreshThis,
              widgetIndex: 4,
            ),
          ],
        ),
      ),
    );
  }
}

class NavbarWidgets extends StatelessWidget {
  const NavbarWidgets({
    super.key,
    required this.img_path,
    required this.active,
    required this.refreshCallback,
    required this.widgetIndex,
  });
  final String img_path;
  final bool active;
  final Function refreshCallback;
  final int widgetIndex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        activeIndex = widgetIndex;
        refreshCallback();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: activeIndex == widgetIndex ? 1 : 0,
            child: Container(
              height: 6,
              width: 30,
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
          ),
          Image.asset(
            img_path,
            width: 30,
            height: 30,
          ),
        ],
      ),
    );
  }
}
