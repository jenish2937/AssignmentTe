import 'package:assignment/utils/color_utils.dart';
import 'package:assignment/utils/image_utils.dart';
import 'package:assignment/view/ticket/ticket_screen.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import '../../view/home_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int selectedIndex = 0;

  void handleNavigation(int index) {
    setState(() {
      selectedIndex = index;
    });

    switch (index) {
      case 0:
        Get.off(() => const HomeScreen());
        break;
      case 1:
        Get.off(() => const HomeScreen());
        break;
      case 2:
        Get.off(() => const TicketScreen());
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.only(bottom: 11.sp),
      child: DotNavigationBar(
        paddingR: EdgeInsetsDirectional.symmetric(horizontal: 3.w),
        marginR: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
        onTap: (index) {
          if (index != selectedIndex) {
            setState(() {
              selectedIndex = index;
              print('======SelectedIndex:====== $selectedIndex');
            });
            handleNavigation(index);
          }
        },
        backgroundColor: ColorUtils.black1,
        splashColor: ColorUtils.black1,
        unselectedItemColor: ColorUtils.grey,
        selectedItemColor: ColorUtils.pink,
        dotIndicatorColor: ColorUtils.pink,
        currentIndex: selectedIndex,
        items: <DotNavigationBarItem>[
          DotNavigationBarItem(
            icon: Icon(Icons.home,
                color: selectedIndex == 0 ? ColorUtils.pink : ColorUtils.grey),
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.groups,
                color: selectedIndex == 1 ? ColorUtils.pink : ColorUtils.grey),
          ),
          DotNavigationBarItem(
            icon: ImageIcon(AssetImage(ImageUtils.ticketIcon),
                size: 24.sp,
                color: selectedIndex == 2 ? ColorUtils.pink : ColorUtils.grey),
          ),
          DotNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage(ImageUtils.circleAvtar),
              radius: 10.sp,
              backgroundColor: ColorUtils.pink,
            ),
          ),
        ],
      ),
    );
  }
}