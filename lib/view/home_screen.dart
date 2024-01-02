import 'package:assignment/common/common_widget/text_widget.dart';
import 'package:assignment/utils/color_utils.dart';
import 'package:assignment/utils/image_utils.dart';
import 'package:assignment/utils/size_utils.dart';
import 'package:assignment/utils/variable_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../common/common_method/bottombar_widget.dart';
import '../common/common_method/home_widget.dart';
import '../common/common_method/search_bar_widget.dart';
import '../common/common_method/search_dialog_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorUtils.black,
        leading: const Icon(Icons.fmd_good, color: ColorUtils.pink),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: const Icon(Icons.notifications),
          )
        ],
        title: TextField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Indira Nagar',
            hintStyle: const TextStyle(color: ColorUtils.white),
            contentPadding: EdgeInsets.symmetric(vertical: 1.h),
            suffixIcon: const Icon(
              Icons.search_sharp,
              color: ColorUtils.white,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.sp),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.sp),
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SearchBarWidget();
              },
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
      body: const CustomHomeWidget(),
    );
  }
}
