import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';

class MinusIcon extends StatelessWidget {
  const MinusIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.backGroundRed,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: Icon(Icons.remove, color: ColorManager.primary, size: 20.sp),
      ),
    );
  }
}
