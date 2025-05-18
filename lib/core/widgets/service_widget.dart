import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';

class ServiceWidget extends StatelessWidget {
  final String title;
  final String description;
  final void Function() onTap;
  const ServiceWidget({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 346.w,
        height: 92.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: ColorManager.backGroundRed,
          border: Border.all(color: ColorManager.primary, width: 1.w),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: StylesManager.getBoldStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s16,
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: ColorManager.primary),
                ],
              ),
              Text(
                description,
                style: StylesManager.getSemiBoldStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
