import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../utils/color_utils.dart';
import '../../utils/image_utils.dart';
import '../../utils/size_utils.dart';
import '../../utils/variable_utils.dart';
import '../common_widget/text_widget.dart';

class CustomHomeWidget extends StatelessWidget {
  const CustomHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 3.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizeUtils.sH(2),
            TextWidget(
              VariableUtils.heyJames,
              textColor: ColorUtils.white,
            ),
            SizeUtils.sH(2),
            TextWidget(
              VariableUtils.yourexperience,
              fontSize: 15.sp,
              textColor: ColorUtils.white,
            ),
            SizeUtils.sH(2),
            SizedBox(
              height: 10.h,
              child: ListView.builder(
                itemCount: 6,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  List<String> imagePath = [
                    ImageUtils.bangloreCity,
                    ImageUtils.mumbiCity,
                    ImageUtils.delhiCity,
                    ImageUtils.mumbiCity,
                    ImageUtils.bangloreCity,
                    ImageUtils.delhiCity,
                  ];
                  return Row(
                    children: [
                      Container(
                        height: 10.h,
                        width: 20.w,
                        margin: EdgeInsets.symmetric(horizontal: 1.w),
                        decoration: BoxDecoration(
                          color: ColorUtils.black,
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Image.asset(
                          imagePath[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizeUtils.sH(4),
            Container(
              height: 50.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: ColorUtils.black,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.sp),
                child: Image.asset(
                  ImageUtils.rectangleProfile,
                  fit: BoxFit.cover
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}