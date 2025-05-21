import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';

class CategoryAndBrandItem extends StatelessWidget {
  final String text;
  final String imagePath;
  final Color? backGroundColor;
  final Color? titleColor;
  final VoidCallback onTap;

  const CategoryAndBrandItem({
    super.key,
    required this.text,
    required this.imagePath,
    required this.onTap,
    this.backGroundColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 50.w,
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: backGroundColor,
        ),
        padding: EdgeInsets.all(8.r),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(imagePath, width: 60.w, height: 60.h),
              SizedBox(height: 5.h),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                style: StylesManager.getBoldStyle(
                  color: titleColor ?? ColorManager.black,
                  fontSize: 12.sp,
                ),
                child: Text(text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
