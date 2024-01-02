import 'package:assignment/common/common_method/search_dialog_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../utils/color_utils.dart';
import '../../utils/image_utils.dart';
import '../../utils/size_utils.dart';
import '../../utils/variable_utils.dart';
import '../common_widget/text_widget.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  final dio = Dio();
  String inputValue = '';
  List<String> cityNames = [];
  List<String> filteredCityNames = [];

  SearchBarWidget({super.key});

  void getPlaces(String value) async {
    const apiKey = 'AIzaSyCjOWuul-db69IzI90Wk2VH1t0z1FeFI0s';
    Response response;

    final queryParams = {
      'key': apiKey,
      'input': value,
    };

    try {
      response = await dio.get(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json',
        queryParameters: queryParams,
      );

      cityNames = [];
      filteredCityNames = [];
      final predictions = response.data['prediction'];
      for (var prediction in predictions) {
        cityNames.add(prediction['description']);
      }
      filteredCityNames = cityNames;
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Widget build(BuildContext context) {
    return AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 4.w),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: ColorUtils.white, width: 0.2.w),
            borderRadius: BorderRadius.circular(10.sp)),
        backgroundColor: ColorUtils.black1,
        content: SizedBox(
          height: 35.h,
          width: 100.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    VariableUtils.chooseLocation,
                    fontWeight: FontWeight.bold,
                    textColor: ColorUtils.white,
                    fontSize: 12.sp,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    color: ColorUtils.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              SizeUtils.sH(1),
              TextField(
                readOnly: true,
                onTap: () {
                  getPlaces(inputValue);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const CustomLocationAlertDialog();
                      });
                },
                style: const TextStyle(color: ColorUtils.white),
                onChanged: (value) {
                  // getPlaces(value);
                },
                decoration: InputDecoration(
                  hintText: VariableUtils.search,
                  hintStyle: const TextStyle(color: ColorUtils.white),
                  contentPadding: EdgeInsets.symmetric(vertical: 1.h),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: ColorUtils.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
              ),
              SizeUtils.sH(2),
              Row(
                children: [
                  CircleAvatar(
                      backgroundColor: ColorUtils.black1,
                      radius: 10.sp,
                      child: Image.asset(ImageUtils.detectLocation)),
                  SizeUtils.sW(2),
                  TextWidget(
                    VariableUtils.detectlocation,
                    fontWeight: FontWeight.bold,
                    textColor: ColorUtils.white,
                    fontSize: 10.sp,
                  )
                ],
              ),
              SizeUtils.sH(2),
              Align(
                alignment: Alignment.bottomLeft,
                child: TextWidget(
                  VariableUtils.suggested,
                  fontWeight: FontWeight.bold,
                  textColor: ColorUtils.white,
                  fontSize: 12.sp,
                ),
              ),
              SizeUtils.sH(1),
              SizedBox(
                height: 10.h,
                child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    List<String> imagePath = [
                      ImageUtils.bangloreCity,
                      ImageUtils.mumbiCity,
                      ImageUtils.delhiCity,
                      ImageUtils.bangloreCity,
                    ];
                    return Row(
                      children: [
                        Container(
                            height: 10.h,
                            width: 22.w,
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.sp)),
                            child: Image.asset(
                              imagePath[index],
                              fit: BoxFit.cover,
                            )),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
// AlertDialog(
//   insetPadding: EdgeInsets.symmetric(horizontal: 4.w),
//   shape: RoundedRectangleBorder(
//       side: BorderSide(color: ColorUtils.white, width: 0.2.w),
//       borderRadius: BorderRadius.circular(10.sp)),
//   backgroundColor: ColorUtils.black1,
//   content: SizedBox(
//     height: 35.h,
//     width: 100.w,
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             TextWidget(
//               VariableUtils.chooseLocation,
//               fontWeight: FontWeight.bold,
//               textColor: ColorUtils.white,
//               fontSize: 12.sp,
//             ),
//             IconButton(
//               icon: const Icon(Icons.close),
//               color: ColorUtils.white,
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         ),
//         SizeUtils.sH(1),
//         TextField(
//           readOnly: true,
//           onTap: () {
//             getPlaces(inputValue);
//             showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return CustomLocationAlertDialog();
//                 });
//           },
//           style: const TextStyle(color: ColorUtils.white),
//           onChanged: (value) {
//             // getPlaces(value);
//           },
//           decoration: InputDecoration(
//             hintText: VariableUtils.search,
//             hintStyle:
//                 const TextStyle(color: ColorUtils.white),
//             contentPadding:
//                 EdgeInsets.symmetric(vertical: 1.h),
//             prefixIcon: const Icon(
//               Icons.search,
//               color: ColorUtils.white,
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.sp),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.sp),
//             ),
//           ),
//         ),
//         SizeUtils.sH(2),
//         Row(
//           children: [
//             CircleAvatar(
//                 backgroundColor: ColorUtils.black1,
//                 radius: 10.sp,
//                 child:
//                     Image.asset(ImageUtils.detectLocation)),
//             SizeUtils.sW(2),
//             TextWidget(
//               VariableUtils.detectlocation,
//               fontWeight: FontWeight.bold,
//               textColor: ColorUtils.white,
//               fontSize: 10.sp,
//             )
//           ],
//         ),
//         SizeUtils.sH(2),
//         Align(
//           alignment: Alignment.bottomLeft,
//           child: TextWidget(
//             VariableUtils.suggested,
//             fontWeight: FontWeight.bold,
//             textColor: ColorUtils.white,
//             fontSize: 12.sp,
//           ),
//         ),
//         SizeUtils.sH(1),
//         SizedBox(
//           height: 10.h,
//           child: ListView.builder(
//             itemCount: 4,
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             physics: const BouncingScrollPhysics(),
//             itemBuilder: (context, index) {
//               List<String> imagePath = [
//                 ImageUtils.bangloreCity,
//                 ImageUtils.mumbiCity,
//                 ImageUtils.delhiCity,
//                 ImageUtils.bangloreCity,
//               ];
//               return Row(
//                 children: [
//                   Container(
//                       height: 10.h,
//                       width: 22.w,
//                       margin: EdgeInsets.symmetric(
//                           horizontal: 1.w),
//                       decoration: BoxDecoration(
//                           borderRadius:
//                               BorderRadius.circular(15.sp)),
//                       child: Image.asset(
//                         imagePath[index],
//                         fit: BoxFit.cover,
//                       )),
//                 ],
//               );
//             },
//           ),
//         )
//       ],
//     ),
//   ));
