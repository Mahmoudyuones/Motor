import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/service_widget.dart';

class OurServicesWidget extends StatelessWidget {
  final ServiceWidget service1;
  final ServiceWidget service2;
  const OurServicesWidget({
    super.key,
    required this.service1,
    required this.service2,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
      height: 257.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: ColorManager.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'من خدماتنا',
                style: StylesManager.getBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s20,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            service1,
            SizedBox(height: 15.h),
            service2,
          ],
        ),
      ),
    );
  }
}
