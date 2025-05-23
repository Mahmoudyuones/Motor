import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';

class AccountInformation extends StatelessWidget {
  final VoidCallback onTap;
  final String iconPath;
  final String title;
  final Color? textColor;
  final Color? iconColor;
  const AccountInformation({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 45.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),

                    child: Image.asset(
                      iconPath,
                      color: ColorManager.primary,
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    title,
                    style: StylesManager.getSemiBoldStyle(
                      color: textColor ?? ColorManager.black,
                      fontSize: FontSize.s14,
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_outlined, color: iconColor),
            ],
          ),
        ),
      ),
    );
  }
}
