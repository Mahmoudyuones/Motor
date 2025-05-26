import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';

class PaymentScreeItem extends StatelessWidget {
  final String productName;
  final double price;
  const PaymentScreeItem({
    super.key,
    required this.price,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            child: Text(
              productName,
              style: StylesManager.getBoldStyle(
                color: ColorManager.grey,
                fontSize: FontSize.s16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Text(
              '${price.toStringAsFixed(0)} ر.ي',
              style: StylesManager.getBoldStyle(
                color: Colors.black,
                fontSize: FontSize.s18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
