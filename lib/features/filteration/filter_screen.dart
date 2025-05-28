import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:motor/core/models/brand_model.dart';
import 'package:motor/core/models/category_model.dart';
import 'package:motor/core/models/filter_model.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/category_and_brand_item.dart';
import 'package:motor/core/widgets/default_elevated_button.dart';
import 'package:motor/core/widgets/suggestion_item.dart';
import 'package:motor/features/screens/search_and_filter_results_screen.dart';

class FilterScreen {
  FilterModel filterModel = FilterModel(
    selectedBrands: [],
    selectedCategories: [],
    selectedModels: [],
  );

  onTapCategoryAndBrandItem(
    BuildContext context,
    FilterModel filterModel,
    List<String> modelNames,
    List<String> brandNames,
  ) {
    FilterShow currentView = FilterShow.brand;

    showBarModalBottomSheet(
      backgroundColor: ColorManager.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      barrierColor: ColorManager.white.withOpacity(0.5),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.all(8.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      currentView == FilterShow.year
                          ? 'سنة الصنع'
                          : currentView == FilterShow.model
                          ? 'الموديلات'
                          : 'الماركات',
                      style: StylesManager.getBoldStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s18,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: Builder(
                      builder: (_) {
                        switch (currentView) {
                          case FilterShow.year:
                            return ListView.separated(
                              itemBuilder: (context, index) {
                                final currentYear = DateTime.now().year;
                                final isSelected =
                                    filterModel.year == null
                                        ? false
                                        : (currentYear - filterModel.year!) ==
                                            index;

                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    border:
                                        isSelected
                                            ? Border.all(
                                              color: ColorManager.primary,
                                              width: 3,
                                            )
                                            : null,
                                  ),
                                  child: SuggestionItem(
                                    title: '${currentYear - index}',
                                    onTap: () {
                                      setState(() {
                                        filterModel.year =
                                            isSelected
                                                ? null
                                                : currentYear - index;

                                        Future.delayed(
                                          const Duration(milliseconds: 100),
                                          () {
                                            setState(() {
                                              Navigator.of(
                                                context,
                                              ).pushReplacementNamed(
                                                SearchAndFilterResultsScreen
                                                    .routeName,
                                              );
                                            });
                                          },
                                        );
                                      });
                                    },
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (context, index) => SizedBox(height: 10.h),
                              itemCount: 50,
                            );

                          case FilterShow.model:
                            return FadeInLeft(
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  bool isSelected =
                                      modelNames[index] ==
                                              filterModel.selectedModel
                                          ? true
                                          : false;

                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      border:
                                          isSelected
                                              ? Border.all(
                                                color: ColorManager.primary,
                                                width: 3,
                                              )
                                              : null,
                                    ),
                                    child: SuggestionItem(
                                      title: modelNames[index],
                                      onTap: () {
                                        setState(() {
                                          filterModel.selectedModel =
                                              modelNames[index];
                                          Future.delayed(
                                            const Duration(milliseconds: 100),
                                            () {
                                              setState(() {
                                                currentView = FilterShow.year;
                                              });
                                            },
                                          );
                                        });
                                      },
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (context, index) => SizedBox(height: 10.h),
                                itemCount: modelNames.length,
                              ),
                            );

                          case FilterShow.brand:
                            return FadeInLeft(
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  bool isSelected =
                                      brandNames[index] ==
                                              filterModel.selectedBrand
                                          ? true
                                          : false;

                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      border:
                                          isSelected
                                              ? Border.all(
                                                color: ColorManager.primary,
                                                width: 3,
                                              )
                                              : null,
                                    ),
                                    child: SuggestionItem(
                                      title: brandNames[index],
                                      onTap: () {
                                        setState(() {
                                          filterModel.selectedBrand =
                                              brandNames[index];
                                          Future.delayed(
                                            const Duration(milliseconds: 100),
                                            () {
                                              setState(() {
                                                currentView = FilterShow.model;
                                              });
                                            },
                                          );
                                        });
                                      },
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (context, index) => SizedBox(height: 10.h),
                                itemCount: brandNames.length,
                              ),
                            );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void showFilterDialog(
    BuildContext context,
    List<BrandModel> brandItems,
    List<CategoryModel> categoryItems,
    List<String> modelsNames,
  ) {
    RangeValues currentRangeValues = const RangeValues(0, 22000);
    showDialog(
      barrierColor: ColorManager.grey.withOpacity(.5),
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Dialog(
              backgroundColor: ColorManager.white,
              insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.83,
                ),
                padding: EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                        child: Text(
                          'الفلتر',
                          style: StylesManager.getBoldStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s18,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      StatefulBuilder(
                        builder: (context, setState) {
                          bool isShowAll = false;
                          final int visibleItemCount = brandItems.length;
                          final int rowCount = (visibleItemCount / 3).ceil();
                          final double itemHeight = 111.h + 8.h;
                          final double gridHeight = rowCount * itemHeight;
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                width: 374.w,
                                height:
                                    (isShowAll == false &&
                                            brandItems.length > 9)
                                        ? 467.h
                                        : gridHeight + 117.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: ColorManager.backGroundWhite,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.h),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'الماركة',
                                          style: StylesManager.getBoldStyle(
                                            color: ColorManager.black,
                                            fontSize: FontSize.s18,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Expanded(
                                        child: GridView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const NeverScrollableScrollPhysics(),

                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 8.w,
                                                mainAxisSpacing: 8.h,
                                                mainAxisExtent: 111.h,
                                              ),
                                          itemCount: brandItems.length,
                                          itemBuilder: (context, index) {
                                            final brand = brandItems[index];
                                            bool isSelected = filterModel
                                                .selectedBrands
                                                .contains(brand);

                                            return AnimatedContainer(
                                              duration: const Duration(
                                                milliseconds: 300,
                                              ),
                                              curve: Curves.easeInOut,
                                              decoration: BoxDecoration(
                                                color:
                                                    isSelected
                                                        ? ColorManager.primary
                                                        : ColorManager.white,
                                                borderRadius:
                                                    BorderRadius.circular(12.r),
                                              ),
                                              child: CategoryAndBrandItem(
                                                text: brand.name,
                                                imagePath: brand.imagePath,
                                                titleColor:
                                                    isSelected
                                                        ? ColorManager.white
                                                        : ColorManager.black,

                                                onTap: () {
                                                  setState(() {
                                                    if (isSelected) {
                                                      filterModel.selectedBrands
                                                          .remove(brand);
                                                    } else {
                                                      filterModel.selectedBrands
                                                          .add(brand);
                                                    }
                                                  });
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      DefaultElevatedButton(
                                        backGroundColor: ColorManager.white,
                                        textColor: ColorManager.primary,

                                        onPressed: () {
                                          setState(() {
                                            isShowAll = !isShowAll;
                                          });
                                        },
                                        text:
                                            isShowAll ? 'عرض أقل' : 'عرض الكل',
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(height: 10.h),
                      StatefulBuilder(
                        builder: (context, setState) {
                          bool isShowAll = false;
                          final int visibleItemCount = modelsNames.length;
                          final int rowCount = (visibleItemCount / 2).ceil();
                          final double itemHeight = 30.h + 8.h;
                          final double gridHeight = rowCount * itemHeight;
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                height:
                                    (isShowAll == false &&
                                            brandItems.length > 9)
                                        ? 243.h
                                        : gridHeight + 130.h,
                                width: 374.w,
                                decoration: BoxDecoration(
                                  color: ColorManager.backGroundWhite,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.h),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'الموديل',
                                          style: StylesManager.getBoldStyle(
                                            color: ColorManager.black,
                                            fontSize: FontSize.s18,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Expanded(
                                        child: StatefulBuilder(
                                          builder: (context, setState) {
                                            return Wrap(
                                              spacing: 8.w,
                                              runSpacing: 8.h,
                                              alignment: WrapAlignment.start,
                                              children:
                                                  modelsNames.map((model) {
                                                    bool isSelected =
                                                        filterModel
                                                            .selectedModels
                                                            .contains(model);
                                                    return InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          if (isSelected) {
                                                            filterModel
                                                                .selectedModels
                                                                .remove(model);
                                                          } else {
                                                            filterModel
                                                                .selectedModels
                                                                .add(model);
                                                          }
                                                        });
                                                      },
                                                      child: AnimatedContainer(
                                                        duration:
                                                            const Duration(
                                                              milliseconds: 900,
                                                            ),
                                                        curve: Curves.easeInOut,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 8.h,
                                                              horizontal: 12.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                              isSelected
                                                                  ? ColorManager
                                                                      .primary
                                                                  : ColorManager
                                                                      .white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8.r,
                                                              ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          textDirection:
                                                              TextDirection.rtl,
                                                          children: [
                                                            if (isSelected) ...[
                                                              Icon(
                                                                Icons.check,
                                                                color:
                                                                    Colors
                                                                        .white,
                                                                size: 18.sp,
                                                              ),
                                                              SizedBox(
                                                                width: 6.w,
                                                              ),
                                                            ],
                                                            Text(
                                                              model,
                                                              style: StylesManager.getBoldStyle(
                                                                color:
                                                                    isSelected
                                                                        ? Colors
                                                                            .white
                                                                        : ColorManager
                                                                            .black,
                                                                fontSize:
                                                                    isSelected
                                                                        ? FontSize
                                                                            .s12
                                                                        : FontSize
                                                                            .s14,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                            );
                                          },
                                        ),
                                      ),

                                      SizedBox(height: 10.h),

                                      DefaultElevatedButton(
                                        backGroundColor: ColorManager.white,
                                        textColor: ColorManager.primary,

                                        onPressed: () {
                                          setState(() {
                                            isShowAll = !isShowAll;
                                          });
                                          print('show all');
                                        },
                                        text: 'عرض الكل',
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(height: 10.h),
                      StatefulBuilder(
                        builder: (context, setState) {
                          bool isShowAll = false;
                          final int visibleItemCount = categoryItems.length;
                          final int rowCount = (visibleItemCount / 3).ceil();
                          final double itemHeight = 111.h + 8.h;
                          final double gridHeight = rowCount * itemHeight;
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                width: 374.w,
                                height:
                                    (isShowAll == false &&
                                            categoryItems.length > 9)
                                        ? 467.h
                                        : gridHeight + 117.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: ColorManager.backGroundWhite,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.h),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'الاقسام',
                                          style: StylesManager.getBoldStyle(
                                            color: ColorManager.black,
                                            fontSize: FontSize.s18,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Expanded(
                                        child: GridView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const NeverScrollableScrollPhysics(),

                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 8.w,
                                                mainAxisSpacing: 8.h,
                                                mainAxisExtent: 111.h,
                                              ),
                                          itemCount: categoryItems.length,
                                          itemBuilder: (context, index) {
                                            final category =
                                                categoryItems[index];
                                            bool isSelected = filterModel
                                                .selectedCategories
                                                .contains(category);

                                            return AnimatedContainer(
                                              duration: const Duration(
                                                milliseconds: 300,
                                              ),
                                              curve: Curves.easeInOut,
                                              decoration: BoxDecoration(
                                                color:
                                                    isSelected
                                                        ? ColorManager.primary
                                                        : ColorManager.white,
                                                borderRadius:
                                                    BorderRadius.circular(12.r),
                                              ),
                                              child: CategoryAndBrandItem(
                                                text: category.name,
                                                imagePath: category.imagePath,
                                                titleColor:
                                                    isSelected
                                                        ? ColorManager.white
                                                        : ColorManager.black,

                                                onTap: () {
                                                  setState(() {
                                                    if (isSelected) {
                                                      filterModel
                                                          .selectedCategories
                                                          .remove(category);
                                                    } else {
                                                      filterModel
                                                          .selectedCategories
                                                          .add(category);
                                                    }
                                                  });
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      DefaultElevatedButton(
                                        backGroundColor: ColorManager.white,
                                        textColor: ColorManager.primary,

                                        onPressed: () {
                                          setState(() {
                                            isShowAll = !isShowAll;
                                            print(isShowAll);
                                          });
                                        },
                                        text:
                                            isShowAll ? 'عرض أقل' : 'عرض الكل',
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: 374.w,
                        padding: EdgeInsets.all(8.h),
                        decoration: BoxDecoration(
                          color: ColorManager.backGroundWhite,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: StatefulBuilder(
                          builder: (context, setState) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'السعر',
                                      style: StylesManager.getBoldStyle(
                                        color: ColorManager.black,
                                        fontSize: FontSize.s18,
                                      ),
                                    ),
                                    Text(
                                      '\$${currentRangeValues.start.toInt()} : \$${currentRangeValues.end.toInt()}',
                                      style: StylesManager.getSemiBoldStyle(
                                        color: ColorManager.grey,
                                        fontSize: FontSize.s18,
                                      ),
                                    ),
                                  ],
                                ),
                                RangeSlider(
                                  values: currentRangeValues,
                                  min: 0,
                                  max: 22000,
                                  divisions: 200,
                                  activeColor: ColorManager.primary,
                                  inactiveColor: Colors.grey[300],
                                  onChanged: (RangeValues values) {
                                    setState(() {
                                      filterModel.minPrice = values.start;
                                      filterModel.maxPrice = values.end;
                                      print(filterModel.minPrice);
                                      print(filterModel.maxPrice);
                                      currentRangeValues = values;
                                    });
                                  },
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 8.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorManager.white,
                                          borderRadius: BorderRadius.circular(
                                            8.r,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'الحد الأدنى',
                                              style:
                                                  StylesManager.getSemiBoldStyle(
                                                    color: Colors.grey,
                                                    fontSize: FontSize.s16,
                                                  ),
                                            ),
                                            Text(
                                              '\$${currentRangeValues.start.toInt()}',
                                              style: StylesManager.getBoldStyle(
                                                color: ColorManager.black,
                                                fontSize: FontSize.s16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 8.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorManager.white,
                                          borderRadius: BorderRadius.circular(
                                            8.r,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'الحد الأقصى',
                                              style:
                                                  StylesManager.getSemiBoldStyle(
                                                    color: Colors.grey,
                                                    fontSize: FontSize.s16,
                                                  ),
                                            ),
                                            Text(
                                              '\$${currentRangeValues.end.toInt()}',
                                              style: StylesManager.getBoldStyle(
                                                color: ColorManager.black,
                                                fontSize: FontSize.s16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              right: 15,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorManager.backGroundRed,
                    borderRadius: BorderRadius.circular(9.r),
                  ),
                  child: Icon(Icons.close, size: 30, color: Colors.red),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

enum FilterShow { year, model, brand }
