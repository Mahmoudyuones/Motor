import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/models/product_model.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/default_elevated_button.dart';
import 'package:motor/core/widgets/order_detailed_widget.dart';
import 'package:motor/core/widgets/payment_method_selector.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = 'payment_screen';
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String address = 'عمارة الكهلاني';
  int selectedPaymentIndex = 0;

  List<ProductModel> products = [
    ProductModel(
      productName: 'Ferrari 6.0-liter F14 Ferrari 6.0-liter F14',
      description: 'Ferrari 6.0-liter F14 Ferrari 6.0-liter F14',
      tag: 'tag',
      category: 'category',
      views: 300,
      sellerName: 'sellerName',
      isFavorite: false,
      imagesPaths: ['assets/images/engine_image.png'],
      oldPrice: 25000,
      newPrice: 22000,
    ),
    ProductModel(
      productName: 'Ferrari 6.0-liter F14 Ferrari 6.0-liter F14',
      description: 'Ferrari 6.0-liter F14 Ferrari 6.0-liter F14',
      tag: 'tag',
      category: 'category',
      views: 300,
      sellerName: 'sellerName',
      isFavorite: false,
      imagesPaths: ['assets/images/engine_image.png'],
      oldPrice: 25000,
      newPrice: 22000,
    ),
    ProductModel(
      productName: 'Ferrari 6.0-liter F14 Ferrari 6.0-liter F14',
      description: 'Ferrari 6.0-liter F14 Ferrari 6.0-liter F14',
      tag: 'tag',
      category: 'category',
      views: 300,
      sellerName: 'sellerName',
      isFavorite: false,
      imagesPaths: ['assets/images/engine_image.png'],
      oldPrice: 25000,
      newPrice: 22000,
    ),
  ];
  double totalPrice = 500000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundWhite,
      body: Stack(
        children: [
          Container(
            height: 140.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home_app_bar_image.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          PositionedDirectional(
            top: 60.h,
            start: 0,
            end: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: ColorManager.backGroundRed.withOpacity(.5),
                        borderRadius: BorderRadius.circular(9.r),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 30,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                  Text(
                    'الدفع',
                    style: StylesManager.getBoldStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  SizedBox(width: 35.w),
                ],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 125.w),
              OrderDetailedWidget(products: products, totalPrice: totalPrice),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'التوصيل الى',
                                      style: StylesManager.getBoldStyle(
                                        color: ColorManager.black,
                                        fontSize: FontSize.s16,
                                      ),
                                    ),
                                    Text(
                                      ' ($address)',
                                      style: StylesManager.getBoldStyle(
                                        color: ColorManager.primary,
                                        fontSize: FontSize.s16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  'جولة الكميم',
                                  style: StylesManager.getBoldStyle(
                                    color: ColorManager.grey,
                                    fontSize: FontSize.s16,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: ColorManager.backGroundRed,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: ColorManager.primary,
                                  size: 35.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'طرق الدفع',
                                style: StylesManager.getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s16,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              PaymentMethodTile(
                                isSelected: selectedPaymentIndex == 0,
                                title: 'فلوسك',
                                imagePath: 'assets/images/your_monet.png',
                                onTap: () {
                                  setState(() {
                                    selectedPaymentIndex = 0;
                                  });
                                },
                              ),
                              PaymentMethodTile(
                                isSelected: selectedPaymentIndex == 1,
                                title: 'جيب',
                                imagePath: 'assets/images/boket.png',
                                onTap: () {
                                  setState(() {
                                    selectedPaymentIndex = 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(12.r),
                    right: Radius.circular(12.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultElevatedButton(
                        onPressed: () {},
                        text: 'تاكيد الدفع',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
