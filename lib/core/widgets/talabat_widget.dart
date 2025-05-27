import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/models/product_model.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/order_detailed_widget.dart';

class TalabatWidget extends StatelessWidget {
  const TalabatWidget({
    super.key,
    required this.date,
    required this.totalPrice,
    required this.products,
    required this.address1,
    required this.address2,
    required this.orderStatus,
    required this.orderId,
  });
  final String orderId;
  final String date;
  final double totalPrice;
  final List<ProductModel> products;
  final String address1;
  final String address2;
  final String orderStatus;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Padding(
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
                  ],
                ),
                SizedBox(height: 12.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      orderStatus,
                      style: StylesManager.getSemiBoldStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 12.sp,
                      color: ColorManager.primary,
                    ),
                    Expanded(
                      child: Divider(
                        color: ColorManager.primary,
                        thickness: 2.h,
                      ),
                    ),
                    Icon(
                      Icons.local_shipping,
                      size: 24.sp,
                      color: Colors.red.shade700,
                    ),
                    Expanded(
                      child: Divider(color: ColorManager.grey, thickness: 2.h),
                    ),
                    Icon(Icons.circle, size: 12.sp, color: ColorManager.grey),
                    Expanded(
                      child: Divider(color: ColorManager.grey, thickness: 2.h),
                    ),
                    Icon(Icons.circle, size: 12.sp, color: ColorManager.grey),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          OrderDetailedWidget(products: products, totalPrice: totalPrice),
        ],
      ),
    );
  }
}
