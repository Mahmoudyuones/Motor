import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';

class PlusIcon extends StatelessWidget {
  const PlusIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: Icon(Icons.add, color: ColorManager.white, size: 20.sp),
      ),
    );
  }
}
