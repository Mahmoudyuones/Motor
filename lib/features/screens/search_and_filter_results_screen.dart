import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/models/brand_model.dart';
import 'package:motor/core/models/category_model.dart';
import 'package:motor/core/models/filter_model.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/default_text_form_field.dart';
import 'package:motor/core/widgets/filter_tap_bar_item.dart';
import 'package:motor/core/widgets/search_Item.dart';
import 'package:motor/features/filteration/filter_screen.dart';

class SearchAndFilterResultsScreen extends StatefulWidget {
  static const routeName = '/results';
  const SearchAndFilterResultsScreen({super.key});

  @override
  State<SearchAndFilterResultsScreen> createState() =>
      _SearchAndFilterResultsScreenState();
}

class _SearchAndFilterResultsScreenState
    extends State<SearchAndFilterResultsScreen> {
  TextEditingController searchController = TextEditingController();
  List<SearchItem> searchItems = List.generate(
    5,
    (index) => SearchItem(
      imagePaths: List.generate(5, (index) => 'assets/images/engine_image.png'),
      onFavorite: () {},
      onShare: () {},
      category: 'فئة المنتج',
      tag: 'تاج تشويقي',
      views: 'مشاهدة 300',
      newPrice: 220000,
      oldPrice: 250000,
      productName: 'Ferrari 6.0-liter F140',
    ),
  );
  List<String> filterItems = ['الماركات', 'الموديل', 'الاقسام', 'سنة الصنع'];
  int? getFilterItemCount(String title) {
    switch (title) {
      case 'الماركات':
        return filterModel.selectedBrands.length;
      case 'الموديل':
        return filterModel.selectedModels.length;
      case 'الاقسام':
        return filterModel.selectedCategories.length;
      default:
        return null;
    }
  }

  FilterModel filterModel = FilterModel(
    selectedBrands: List.generate(
      1,
      (index) => BrandModel(
        name: 'ماركة{$index}',
        imagePath: 'assets/images/brand_image.png',
      ),
    ),
    selectedModels: ['موديل 1', 'موديل 2', 'موديل 3'],
    selectedCategories: List.generate(
      3,
      (index) => CategoryModel(
        name: 'قسم{$index}',
        imagePath: 'assets/images/category_image.png',
      ),
    ),
    year: 2020,
    maxPrice: 20000,
    minPrice: 5000,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundWhite,
      body: Stack(
        children: [
          Container(
            height: 150.h,
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
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Column(
                children: [
                  Row(
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
                      SizedBox(
                        width: 338.w,
                        height: 46.h,
                        child: DefaultTextFormField(
                          onChanged: (p0) {
                            setState(() {});
                          },
                          isSearch: true,
                          prefixIcon: InkWell(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Image.asset(
                                'assets/icons/Search Icon.png',
                                width: 24.w,
                                height: 24.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          hintText: 'ما الذي تبحث عنه',
                          isPassword: false,
                          controller: searchController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: 30.h,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              FilterScreen().showFilterDialog(
                                context,
                                filterModel.selectedBrands,
                                filterModel.selectedCategories,
                                filterModel.selectedModels,
                              );
                            },
                            child: Container(
                              height: 26.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                color: ColorManager.backGroundWhite,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    'assets/icons/filter.png',
                                    width: 18.w,
                                    height: 18.h,
                                    fit: BoxFit.fill,
                                    color: ColorManager.primary,
                                  ),
                                  Text(
                                    'الفلتر',
                                    style: StylesManager.getSemiBoldStyle(
                                      color: ColorManager.primary,
                                      fontSize: FontSize.s12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder:
                                  (context, index) => InkWell(
                                    onTap: () {},
                                    child: FilterTapBarItem(
                                      title: filterItems[index],
                                      number: getFilterItemCount(
                                        filterItems[index],
                                      ),
                                    ),
                                  ),
                              separatorBuilder:
                                  (context, index) => SizedBox(width: 20.w),
                              itemCount: filterItems.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child:
                searchItems.isEmpty
                    ? Center(
                      child: Column(
                        children: [
                          SizedBox(height: 350.h),
                          Image.asset('assets/icons/box-add.png'),
                          SizedBox(height: 20.h),
                          Text(
                            'لا يوجد منتجات بالبانات المدخلة ',
                            style: StylesManager.getSemiBoldStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s16,
                            ),
                          ),
                          Text(
                            'يمكنك طلبة وبارت موتور سوف يقوم بتوفيرة لك ',
                            style: StylesManager.getSemiBoldStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s16,
                            ),
                          ),
                          SizedBox(height: 40.h),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'اطلب الان',
                                  style: StylesManager.getSemiBoldStyle(
                                    color: ColorManager.primary,
                                    fontSize: FontSize.s16,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Icon(
                                  Icons.arrow_forward,
                                  color: ColorManager.primary,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    : Column(
                      children: [
                        SizedBox(height: 140.h),
                        Container(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '100 عنصر من نتاءج البحث',
                              style: StylesManager.getSemiBoldStyle(
                                color: ColorManager.grey,
                                fontSize: FontSize.s16,
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.all(0),
                            itemBuilder: (context, index) => searchItems[index],

                            separatorBuilder:
                                (context, index) => SizedBox(height: 20.h),
                            itemCount: searchItems.length,
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
