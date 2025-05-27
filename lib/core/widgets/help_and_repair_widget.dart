import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';

class HelpAndRepairWidget extends StatelessWidget {
  final String orderId;
  final String date;
  final String address1;
  final String address2;
  final String vehicleType;
  final String phoneNumber;
  final String description;

  const HelpAndRepairWidget({
    super.key,
    required this.orderId,
    required this.date,
    required this.address1,
    required this.address2,
    required this.vehicleType,
    required this.phoneNumber,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  orderId,
                  style: StylesManager.getSemiBoldStyle(
                    color: ColorManager.grey,
                    fontSize: FontSize.s14,
                  ),
                ),
                Text(
                  date,
                  style: StylesManager.getSemiBoldStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s14,
                  ),
                ),
              ],
            ),
            Divider(height: 24.h),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: ColorManager.backGroundRed,
                  ),
                  padding: EdgeInsets.all(8.w),
                  child: Image.asset(
                    'assets/icons/box.png',
                    height: 30.h,
                    width: 30.w,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        address1,
                        style: StylesManager.getSemiBoldStyle(
                          color: ColorManager.primary,
                          fontSize: FontSize.s16,
                        ),
                      ),
                      Text(
                        address2,
                        style: StylesManager.getSemiBoldStyle(
                          color: ColorManager.grey,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
              ],
            ),
            SizedBox(height: 12.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: ColorManager.backGroundWhite,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'نوع المركبة',
                      style: StylesManager.getBoldStyle(
                        color: ColorManager.grey,
                        fontSize: FontSize.s14,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      vehicleType,
                      style: StylesManager.getSemiBoldStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s16,
                      ),
                    ),
                    Divider(height: 24.h),
                    Text(
                      'رقم الهاتف',
                      style: StylesManager.getBoldStyle(
                        color: ColorManager.grey,
                        fontSize: FontSize.s14,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      phoneNumber,
                      style: StylesManager.getSemiBoldStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s16,
                      ),
                    ),
                    Divider(height: 24.h),
                    Text(
                      'وصف لحالة العطل (اختياري)',
                      style: StylesManager.getBoldStyle(
                        color: ColorManager.grey,
                        fontSize: FontSize.s14,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      description,
                      style: StylesManager.getSemiBoldStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
