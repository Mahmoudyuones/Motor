import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/models/product_model.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/help_and_repair_widget.dart';
import 'package:motor/core/widgets/talabat_widget.dart';

class TalapatyTap extends StatefulWidget {
  TalapatyTap({super.key});

  @override
  State<TalapatyTap> createState() => _TalapatyTapState();
}

class _TalapatyTapState extends State<TalapatyTap> {
  bool isProductsSelected = false;
  final int orderCompleted = 3;

  final int orderInProgress = 2;

  final double totalPrice = 500000;

  final String date = '12-12-2024 - 02:20';

  final List<ProductModel> products = [
    ProductModel(
      productName: 'x',
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
      productName: 'xx',
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
      productName: 'xxxx',
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

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          top: 55.h,
          start: 20.w,
          end: 15.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'طلباتي',
                    style: StylesManager.getBoldStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '$orderCompleted مكتملة',
                        style: StylesManager.getRegularStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s16,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                        child: VerticalDivider(
                          width: 20.w,
                          thickness: 1.5,
                          color: ColorManager.backGroundWhite,
                        ),
                      ),
                      Text(
                        '$orderInProgress قيد التقدم',
                        style: StylesManager.getRegularStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  print('refresh tapped');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'تحديث',
                        style: StylesManager.getSemiBoldStyle(
                          color: ColorManager.primary,
                          fontSize: FontSize.s14,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorManager.backGroundRed,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Icon(
                          Icons.refresh,
                          color: ColorManager.primary,
                          size: 25.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Column(
            children: [
              SizedBox(height: 130.h),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (isProductsSelected) return;
                      setState(() {
                        isProductsSelected = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isProductsSelected
                              ? ColorManager.primary
                              : ColorManager.backGroundWhite,
                      foregroundColor:
                          isProductsSelected
                              ? ColorManager.white
                              : ColorManager.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                    ),
                    child: Text(
                      'المنتجات',
                      style: StylesManager.getSemiBoldStyle(
                        color:
                            isProductsSelected
                                ? ColorManager.white
                                : ColorManager.primary,
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  ElevatedButton(
                    onPressed: () {
                      if (!isProductsSelected) return;
                      setState(() {
                        isProductsSelected = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          !isProductsSelected
                              ? ColorManager.primary
                              : ColorManager.backGroundWhite,
                      foregroundColor:
                          !isProductsSelected
                              ? ColorManager.white
                              : ColorManager.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                    ),
                    child: Text(
                      'خدمة الصيانة والانقاذ',
                      style: StylesManager.getSemiBoldStyle(
                        color:
                            !isProductsSelected
                                ? ColorManager.white
                                : ColorManager.primary,
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                key: ValueKey(
                  '$int-${isProductsSelected ? 'product' : 'service'}',
                ),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => SizedBox(height: 20.h),
                  itemBuilder:
                      (context, index) =>
                          isProductsSelected
                              ? FadeIn(
                                key: ValueKey(index),
                                child: TalabatWidget(
                                  date: '$date مساءً',
                                  totalPrice: 220000,
                                  products: products,
                                  address1: 'جوار جولة الكميم عمارة الكهلاني',
                                  address2: 'عمارة الكهلاني جوار جولة الكميم',
                                  orderStatus: 'جاري التوصيل',
                                  orderId: '#548572',
                                ),
                              )
                              : FadeIn(
                                key: ValueKey(index),
                                child: HelpAndRepairWidget(
                                  date: '$date مساءً',
                                  orderId: '#548572',
                                  address1: 'جوار جولة الكميم عمارة الكهلاني',
                                  address2: 'عمارة الكهلاني جولة جولة الكميم',
                                  vehicleType: 'سيارة',
                                  phoneNumber: '967-770819441+',
                                  description: 'أنفجار الإطار الأمامي',
                                ),
                              ),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
