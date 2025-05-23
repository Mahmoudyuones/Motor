import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/models/product_model.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/default_elevated_button.dart';
import 'package:motor/core/widgets/detail_product_item.dart';
import 'package:motor/core/widgets/most_ordered_and_offers.dart';
import 'package:motor/core/widgets/product_card.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/ product-details-screen';
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late String imagePath;

  void onShare() {}
  late ProductModel _productModel;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _productModel = ModalRoute.of(context)?.settings.arguments as ProductModel;
    imagePath = _productModel.imagesPaths.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10.h),
                  child: Column(
                    children: [
                      Container(
                        height: 217.h,
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),

                        child: Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                imagePath,
                                width: 150.w,
                                height: 120.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              top: 10.h,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        width: 40.w,
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.2,
                                              ),
                                              spreadRadius: 1,
                                              blurRadius: 8,
                                              offset: Offset(0, 4),
                                            ),
                                          ],
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(
                                            8.r,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 5.w),
                                          child: Icon(
                                            Icons.arrow_back_ios_new_sharp,
                                            size: 25.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: onShare,
                                          child: Container(
                                            width: 40.w,
                                            height: 40.h,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  spreadRadius: 1,
                                                  blurRadius: 8,
                                                  offset: Offset(0, 4),
                                                ),
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: Image.asset(
                                              "assets/icons/Share.png",
                                              height: 25.h,
                                              width: 25.w,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 15.w),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              _productModel.isFavorite =
                                                  !_productModel.isFavorite;
                                            });
                                          },
                                          child: Container(
                                            width: 40.w,
                                            height: 40.h,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  spreadRadius: 1,
                                                  blurRadius: 8,
                                                  offset: Offset(0, 4),
                                                ),
                                              ],
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: Icon(
                                              _productModel.isFavorite
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color:
                                                  _productModel.isFavorite
                                                      ? Colors.red
                                                      : Colors.grey,
                                              size: 25.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),

                      SizedBox(
                        height: 50,

                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder:
                              (context, index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    imagePath =
                                        _productModel.imagesPaths[index];
                                  });
                                },
                                child: Container(
                                  width: 64.w,
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: ColorManager.white,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      _productModel.imagesPaths[index],
                                      height: 35.h,
                                      width: 45.w,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                          separatorBuilder:
                              (context, index) => SizedBox(width: 5.w),
                          itemCount: _productModel.imagesPaths.length,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Text(
                            '${_productModel.newPrice.toStringAsFixed(0)} ر.ي',
                            style: StylesManager.getSemiBoldStyle(
                              color: ColorManager.primary,
                              fontSize: FontSize.s22,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '${_productModel.oldPrice.toStringAsFixed(0)} ر.ي',
                            style: TextStyle(
                              fontFamily: FontConstants.fontFamily,
                              fontSize: FontSize.s17,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _productModel.category,
                            style: StylesManager.getSemiBoldStyle(
                              color: ColorManager.grey,
                              fontSize: FontSize.s16,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                _productModel.tag,
                                style: StylesManager.getSemiBoldStyle(
                                  color: ColorManager.grey,
                                  fontSize: FontSize.s16,
                                ),
                              ),
                              SizedBox(width: 8.w),

                              Text(
                                'مشاهدة ${_productModel.views}',
                                style: StylesManager.getSemiBoldStyle(
                                  color: ColorManager.grey,
                                  fontSize: FontSize.s16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          _productModel.productName,
                          style: StylesManager.getBoldStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s20,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        _productModel.description,
                        style: StylesManager.getBoldStyle(
                          color: ColorManager.grey,
                          fontSize: FontSize.s14,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        height: 69.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: ColorManager.white,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'تفاصيل',
                          style: StylesManager.getBoldStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s20,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      DetailProductItem(
                        text1: 'كيلو متر',
                        text2: 0.toString(),
                        backGroundColor: ColorManager.white,
                      ),
                      DetailProductItem(
                        text1: 'سنة التصنيع',
                        text2: 2014.toString(),
                        backGroundColor: ColorManager.backGroundWhite,
                      ),
                      DetailProductItem(
                        text1: 'كيلو متر',
                        text2: 0.toString(),
                        backGroundColor: ColorManager.white,
                      ),
                      DetailProductItem(
                        text1: 'سنة التصنيع',
                        text2: 2014.toString(),
                        backGroundColor: ColorManager.backGroundWhite,
                      ),
                      DetailProductItem(
                        text1: 'كيلو متر',
                        text2: 0.toString(),
                        backGroundColor: ColorManager.white,
                      ),
                      DetailProductItem(
                        text1: 'سنة التصنيع',
                        text2: 2014.toString(),
                        backGroundColor: ColorManager.backGroundWhite,
                      ),
                      DetailProductItem(
                        text1: 'كيلو متر',
                        text2: 0.toString(),
                        backGroundColor: ColorManager.white,
                      ),
                      DetailProductItem(
                        text1: 'سنة التصنيع',
                        text2: 2014.toString(),
                        backGroundColor: ColorManager.backGroundWhite,
                      ),
                      DetailProductItem(
                        text1: 'كيلو متر',
                        text2: 0.toString(),
                        backGroundColor: ColorManager.white,
                      ),
                      DetailProductItem(
                        text1: 'سنة التصنيع',
                        text2: 2014.toString(),
                        backGroundColor: ColorManager.backGroundWhite,
                      ),
                      DetailProductItem(
                        text1: 'الحالة',
                        text2: 'عالي',
                        backGroundColor: ColorManager.white,
                      ),
                      SizedBox(height: 15.h),
                      MostOrderedAndOffers(
                        title: 'منتجات مشابهة',
                        items: [
                          ProductCard(
                            onFavorite: () {
                              print('favorite');
                            },
                            onShare: () {
                              print('share');
                            },
                            imagePath: 'assets/images/engine_image.png',
                            category: 'فئة المنتج',
                            tag: 'تاج تشويقي',
                            views: 300,
                            productName: 'Ferrari 6.0-liter F140',
                            oldPrice: 22000,
                            newPrice: 20000,
                          ),
                          ProductCard(
                            onFavorite: () {
                              print('favorite');
                            },
                            onShare: () {
                              print('share');
                            },
                            imagePath: 'assets/images/engine_image.png',
                            category: 'فئة المنتج',
                            tag: 'تاج تشويقي',
                            views: 300,
                            productName: 'Ferrari 6.0-liter F140',
                            oldPrice: 22000,
                            newPrice: 20000,
                          ),
                          ProductCard(
                            onFavorite: () {
                              print('favorite');
                            },
                            onShare: () {
                              print('share');
                            },
                            imagePath: 'assets/images/engine_image.png',
                            category: 'فئة المنتج',
                            tag: 'تاج تشويقي',
                            views: 300,
                            productName: 'Ferrari 6.0-liter F140',
                            oldPrice: 22000,
                            newPrice: 20000,
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 70.h,
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
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 45.w,
                          height: 45.h,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/profile.png',
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.right,
                              'البائع',
                              style: StylesManager.getBoldStyle(
                                color: ColorManager.grey,
                                fontSize: FontSize.s16,
                              ),
                            ),
                            Text(
                              _productModel.sellerName,
                              style: StylesManager.getMediumStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s17,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    DefaultElevatedButton(
                      width: 140.w,
                      onPressed: () {},
                      text: 'اضافة للسلة',
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
