import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/models/brand_model.dart';
import 'package:motor/core/models/category_model.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/product_card.dart';
import 'package:motor/core/widgets/categories_widget.dart';
import 'package:motor/core/widgets/image_shower.dart';
import 'package:motor/core/widgets/most_ordered_and_offers.dart';
import 'package:motor/core/widgets/our_services_widget.dart';
import 'package:motor/core/widgets/service_widget.dart';
import 'package:motor/features/filteration/filter_screen.dart';
import 'package:motor/features/screens/search_screen.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  TextEditingController searchController = TextEditingController();
  final String userName = 'أحمد ';
  final String userLocation = 'الرياض';
  List<String> imagesShowerPathsList = [
    'assets/images/car.png',
    'assets/images/car.png',
    'assets/images/car.png',
    'assets/images/car.png',
    'assets/images/car.png',
  ];
  List<BrandModel> filteredBrands = List.generate(
    21,
    (index) => BrandModel(
      name: 'ماركة $index',
      imagePath: 'assets/images/brand_image.png',
    ),
  );
  List<CategoryModel> filteredCategory = List.generate(
    5,
    (index) => CategoryModel(
      name: 'قسم $index',
      imagePath: 'assets/images/category_image.png',
    ),
  );
  List<String> filteredModels = [
    'مرسيدس بنز S-Class',
    'مرسيدس بنز C-Class',
    'مرسيدس بنز G-Class',
    'مرسيدس بنز A-Class',
    'مرسيدس بنز x-Class',
    'مرسيدس بنز d-Class',
    'مرسيدس بنز b-Class',
    'مرسيدس بنز s-Class',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 250.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/home_app_bar_image.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              PositionedDirectional(
                top: 39.h,
                start: 0,
                end: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 56.44.w,
                                  height: 42.h,
                                  child: Image.asset(
                                    'assets/icons/app_logo.png',
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'صباح الخير  ',
                                          style: StylesManager.getRegularStyle(
                                            color: ColorManager.white,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        Text(
                                          userName,
                                          style: StylesManager.getBoldStyle(
                                            color: ColorManager.white,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'موقعك الحالي:  ',
                                          style: StylesManager.getRegularStyle(
                                            color: ColorManager.white,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        Text(
                                          userLocation,
                                          style: StylesManager.getBoldStyle(
                                            color: ColorManager.white,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print('notification');
                            },
                            child: Container(
                              width: 42.w,
                              height: 42.h,
                              decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.r),
                                child: Image.asset(
                                  'assets/icons/notification.png',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      InkWell(
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed(SearchScreen.routeName);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorManager.backGroundWhite.withOpacity(
                              .25,
                            ),
                            border: Border.all(
                              color: ColorManager.backGroundWhite.withOpacity(
                                .25,
                              ),
                              width: 6.w,
                            ),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: ColorManager.white,
                            ),
                            width: 370.w,
                            height: 54.h,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                              bottom: 8.h,
                                            ),
                                            height: 42.h,
                                            width: 42.w,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: ColorManager.white,
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: Image.asset(
                                              'assets/icons/Search Icon.png',
                                              width: 24.w,
                                              height: 24.h,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Text(
                                            'ما الذي تبحث عنه',
                                            style: StylesManager.getBoldStyle(
                                              color: ColorManager.grey,
                                              fontSize: FontSize.s18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      FilterScreen().showFilterDialog(
                                        context,
                                        filteredBrands,
                                        filteredCategory,
                                        [
                                          'مرسيدس بنز S-Class',
                                          'مرسيدس بنز C-Class',
                                          'مرسيدس بنز G-Class',
                                          'مرسيدس بنز A-Class',
                                          'مرسيدس بنز x-Class',
                                          'مرسيدس بنز d-Class',
                                          'مرسيدس بنز b-Class',
                                          'مرسيدس بنز s-Class',
                                        ],
                                      );
                                    },
                                    child: Container(
                                      height: 42.h,
                                      width: 42.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ColorManager.primary,
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                      ),
                                      child: Image.asset(
                                        'assets/icons/filter.png',
                                        width: 24.w,
                                        height: 24.h,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: -80.h,

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ImageShower(images: imagesShowerPathsList),
                ),
              ),
            ],
          ),
          SizedBox(height: 100.h),
          OurServicesWidget(
            service1: ServiceWidget(
              onTap: () {
                print('service 1');
              },
              title: 'خدمة الصيانة والإنقاذ على الطريق',
              description:
                  'مساعدة فورية على الطريق تشمل إصلاحات بسيطة، سحب، شحن بطارية، وتزويد وقود',
            ),
            service2: ServiceWidget(
              onTap: () {
                print('service 2');
              },
              title: 'حجز استشارة هندسية/فنية من مختصين',
              description:
                  'حجز استشارة هندسية أو فنية مباشرة من مختصين لتقييم وحل مشكلتك بدقة',
            ),
          ),
          SizedBox(height: 20.h),
          CategoriesWidget(
            brandNames: ['تيوتا1', '2تيوتا', '3تيوتا', '4تيوتا'],
            modelsNames: [
              'كامري',
              'كامري هايبرد',
              'كامري سبورت',
              'كامري XSE',
              'كامري LE',
            ],
          ),
          SizedBox(height: 20.h),
          MostOrderedAndOffers(
            title: 'الاكثر طلباََ',
            items: [
              ProductCard(
                imagePath: 'assets/images/engine_image.png',
                category: 'فئة المنتج',
                tag: 'تاج تشويقي',
                views: 300,
                productName: 'Ferrari 6.0-liter F140',
                oldPrice: 22000,
                newPrice: 20000,
                onFavorite: () {
                  print('favorite');
                },
                onShare: () {
                  print('share');
                },
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
          SizedBox(height: 20.h),
          MostOrderedAndOffers(
            title: 'عروض وخصومات حصرية',
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
          SizedBox(height: 100.h),
        ],
      ),
    );
  }
}
