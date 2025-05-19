import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';

class SuggestionItem extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  const SuggestionItem({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 366.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: ColorManager.backGroundWhite,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: StylesManager.getSemiBoldStyle(
                  color: ColorManager.grey,
                  fontSize: FontSize.s16,
                ),
              ),
              Icon(Icons.arrow_forward, color: ColorManager.grey, size: 25.sp),
            ],
          ),
        ),
      ),
    );
  }
}
