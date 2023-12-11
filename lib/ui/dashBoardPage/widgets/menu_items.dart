import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test3_21nov/values/app_color.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height:50.h,
          color: AppColor.lightPurple,
        ),
        Container(
          height:50.h,
          color: AppColor.pinkPurple,
        ),
        Container(
          height:50.h,
          color: AppColor.light,
        ),
      ],
    );
  }
}
