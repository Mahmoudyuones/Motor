import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/models/product_model.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/payment_scree_item.dart';

import '../resources/color_manager.dart' show ColorManager;

class OrderDetailedWidget extends StatelessWidget {
  final List<ProductModel> products;
  final double totalPrice;
  const OrderDetailedWidget({
    super.key,
    required this.products,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: ColorManager.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 12.h,
              left: 10.w,
              right: 10.w,
              top: 10.h,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: ColorManager.backGroundWhite,
              ),
              child: SizedBox(
                height: 200,
                child: ListView.separated(
                  padding: EdgeInsets.only(
                    top: 10.h,
                    bottom: 0.h,
                    left: 10.w,
                    right: 10.w,
                  ),
                  itemBuilder:
                      (context, index) => PaymentScreeItem(
                        price: products[index].newPrice,
                        productName: products[index].productName,
                      ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: products.length,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: DottedLine(
              dashLength: 6.0,
              dashGapLength: 6.0,
              lineThickness: 2.0,
              dashColor: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'الاجمالي',
                  style: StylesManager.getBoldStyle(
                    color: ColorManager.grey,
                    fontSize: FontSize.s17,
                  ),
                ),
                Text(
                  '${totalPrice.toStringAsFixed(0)} ر.ي',
                  style: StylesManager.getBoldStyle(
                    color: Colors.black,
                    fontSize: FontSize.s20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
