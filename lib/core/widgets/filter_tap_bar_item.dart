import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';

class FilterTapBarItem extends StatelessWidget {
  final String title;
  final int? number;

  const FilterTapBarItem({super.key, required this.title, this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26.h,
      decoration: BoxDecoration(
        color: ColorManager.backGroundWhite,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Row(
            children: [
              Text(
                number == null ? title : '$title(${number.toString()})',
                style: StylesManager.getSemiBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s14,
                ),
              ),
              SizedBox(width: 5.w),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.grey,
                ),
                child: Center(
                  child: Icon(Icons.keyboard_arrow_down_sharp, size: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
