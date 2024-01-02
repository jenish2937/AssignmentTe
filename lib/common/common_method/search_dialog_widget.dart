import 'package:assignment/utils/variable_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import '../../utils/color_utils.dart';
import '../../utils/size_utils.dart';
import '../common_widget/text_widget.dart';

class CustomLocationAlertDialog extends StatefulWidget {
  const CustomLocationAlertDialog({super.key});

  @override
  State<CustomLocationAlertDialog> createState() =>
      _CustomLocationAlertDialogState();
}

class _CustomLocationAlertDialogState extends State<CustomLocationAlertDialog> {
  final TextEditingController _searchController = TextEditingController();

  final dio = Dio();
  String inputValue = '';
  List<String> cityNames = [];
  List<String> filteredCityNames = [];

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
      final predictions = response.data['predictions'];
      for (var prediction in predictions) {
        cityNames.add(prediction['description']);
        cityNames.first;
      }
      setState(() {
        filteredCityNames = cityNames
            .where((city) => city.toLowerCase().startsWith(value.toLowerCase()))
            .toList();
        print('===filteredCityNames====>$filteredCityNames');
      });
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  String displayCityNames() {
    return filteredCityNames.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 4.w),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: ColorUtils.white, width: 0.2.sp),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      backgroundColor: ColorUtils.black1,
      content: SizedBox(
        height: 35.h,
        width: 100.w,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  VariableUtils.chooseLocation,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.white,
                    fontSize: 12.sp,
                  ),
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
              controller: _searchController,
              style: const TextStyle(color: ColorUtils.white),
              onChanged: (value) {
                getPlaces(value);
              },
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.symmetric(vertical: 1.h),
                prefixIcon: const Icon(
                  Icons.search,
                  color: ColorUtils.white,
                ),
                suffixIcon: GestureDetector(
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.close,
                          size: 20.sp, color: ColorUtils.white)),
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
            SizedBox(
              height: 17.h,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: filteredCityNames.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextWidget(
                            filteredCityNames[index],
                            textColor: ColorUtils.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizeUtils.sH(2),
          ],
        ),
      ),
    );
  }
}

// void handleNavigation(int index) {
//   setState(() {
//     selectedIndex = index;
//   });
//
//   switch (selectedIndex) {
//     case 0:
//       Get.off(() => const HomeScreen());
//       break;
//     case 1:
//       Get.off(() => const Scaffold());
//       break;
//     case 2:
//       Get.off(() => const TicketScreen());
//       break;
//   }
// }