import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/models/product_model.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/minuse_icon.dart';
import 'package:motor/core/widgets/plus_icon.dart';
import 'package:motor/core/widgets/x_icon.dart';

class BasketItem extends StatelessWidget {
  final ProductModel productModel;
  final int productCounter;
  final void Function()? onRemoveTap;
  final void Function()? onPlusTap;
  final void Function()? onMinusTap;
  const BasketItem({
    super.key,
    required this.productModel,
    this.onRemoveTap,
    this.onPlusTap,
    this.onMinusTap,
    required this.productCounter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              color: ColorManager.backGroundWhite,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Image.asset(
              productModel.imagesPaths.first,
              height: 60.h,
              width: 80.w,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: Text(
                        productModel.productName,
                        style: StylesManager.getSemiBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s17,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: InkWell(onTap: onRemoveTap, child: XIcon()),
                    ),
                  ],
                ),

                SizedBox(height: 8.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${productModel.newPrice.toStringAsFixed(0)} ر.ي',
                          style: StylesManager.getBoldStyle(
                            color: Colors.red,
                            fontSize: FontSize.s18,
                          ),
                        ),
                        if (productModel.oldPrice > productModel.newPrice)
                          Text(
                            '${productModel.oldPrice.toStringAsFixed(0)} ر.ي',
                            style: StylesManager.getRegularStyle(
                              color: Colors.grey,
                              fontSize: FontSize.s14,
                            ).copyWith(decoration: TextDecoration.lineThrough),
                          ),
                      ],
                    ),

                    SizedBox(width: 10.w),
                    InkWell(onTap: onPlusTap, child: PlusIcon()),
                    Container(
                      padding: EdgeInsets.only(top: 5.h),
                      decoration: BoxDecoration(
                        color: ColorManager.backGroundWhite,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          productCounter.toString(),
                          style: StylesManager.getBoldStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s16,
                          ),
                        ),
                      ),
                    ),
                    InkWell(onTap: onMinusTap, child: MinusIcon()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
