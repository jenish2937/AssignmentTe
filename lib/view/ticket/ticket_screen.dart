import 'package:assignment/common/common_widget/text_widget.dart';
import 'package:assignment/utils/color_utils.dart';
import 'package:assignment/utils/image_utils.dart';
import 'package:assignment/utils/variable_utils.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../common/common_method/bottombar_widget.dart';
import '../../utils/size_utils.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorUtils.black,
      appBar: AppBar(
        backgroundColor: ColorUtils.black,
        centerTitle: true,
        leading: const TextWidget(
          '',
          textColor: ColorUtils.black,
        ),
        scrolledUnderElevation: 0.sp,
        title: TextWidget(
          VariableUtils.yourTickets,
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
          textColor: ColorUtils.white,
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
      body:
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            SizeUtils.sH(2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 4.5.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                      color: ColorUtils.black,
                      borderRadius: BorderRadius.circular(5.sp)),
                  child: Center(
                      child: TextWidget(
                    VariableUtils.upComing,
                    textColor: ColorUtils.white,
                    fontWeight: FontWeight.bold,
                  )),
                ),
                SizeUtils.sW(2),
                Container(
                  height: 4.5.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                      color: ColorUtils.pink,
                      borderRadius: BorderRadius.circular(5.sp)),
                  child: Center(
                      child: TextWidget(
                    VariableUtils.history,
                    textColor: ColorUtils.white,
                    fontWeight: FontWeight.bold,
                  )),
                ),
              ],
            ),
            SizeUtils.sH(3),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 350,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                  width: 320,
                                  child:
                                      Image.asset(ImageUtils.anujJainTicket)),
                            ],
                          ),
                          Positioned(
                            top: 62,
                            width: 320,
                            child: Image.asset(ImageUtils.tylorSwiftTicket),
                          ),
                          Positioned(
                            bottom: 48,
                            width: 320,
                            child: Image.asset(ImageUtils.mikeShinodaTicket),
                          ),
                        ],
                      ),
                    ),
                    SizeUtils.sH(1),
                    Container(
                      height: 500,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                  width: 320,
                                  child: Image.asset(
                                      ImageUtils.chesterBennington)),
                            ],
                          ),
                          Positioned(
                            top: 100,
                            width: 320,
                            child: Image.asset(ImageUtils.anson),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}