import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';

class PaymentMethodTile extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.isSelected,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: ColorManager.backGroundWhite,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            SizedBox(width: 12.w),
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                color:
                    isSelected
                        ? ColorManager.backGroundRed.withOpacity(0.1)
                        : ColorManager.backGroundWhite,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            SizedBox(width: 12.w),
            Text(
              title,
              textAlign: TextAlign.end,
              style: StylesManager.getBoldStyle(
                color: Colors.black,
                fontSize: FontSize.s16,
              ),
            ),
            Spacer(),
            Container(
              width: 24.w,
              height: 24.w,
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.red : Colors.grey.shade700,
                  width: 2,
                ),
              ),
              child:
                  isSelected
                      ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      )
                      : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
