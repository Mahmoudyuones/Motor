import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';

class DetailProductItem extends StatelessWidget {
  final String text1;
  final String text2;
  final Color backGroundColor;
  const DetailProductItem({
    super.key,
    required this.text1,
    required this.text2,
    required this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text1,
              style: StylesManager.getBoldStyle(
                color: ColorManager.grey,
                fontSize: FontSize.s16,
              ),
            ),
            Text(
              text2,

              style: StylesManager.getBoldStyle(
                color: ColorManager.black,
                fontSize: FontSize.s16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
