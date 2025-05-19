import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:motor/core/models/brand_model.dart';
import 'package:motor/core/models/filter_model.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/category_and_brand_item.dart';
import 'package:motor/core/widgets/default_elevated_button.dart';
import 'package:motor/core/widgets/suggestion_item.dart';

class FilterScreen {
  FilterModel filterModel = FilterModel();

  onTapCategoryAndBrandItem(
    BuildContext context,
    FilterModel filterModel,
    List<String> modelNames,
  ) {
    bool showYear = true;

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
                      showYear ? 'سنة الصنع' : 'الموديلات',
                      style: StylesManager.getBoldStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s18,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child:
                        showYear
                            ? ListView.separated(
                              itemBuilder: (context, index) {
                                final currentYear = DateTime.now().year;
                                final isSelected =
                                    filterModel.year == null
                                        ? false
                                        : (currentYear - filterModel.year!) ==
                                            index;
                                print(filterModel.year);

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
                                              showYear = false;
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
                            )
                            : FadeInLeft(
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: SuggestionItem(
                                      title: modelNames[index],
                                      onTap: () {},
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (context, index) => SizedBox(height: 10.h),
                                itemCount: modelNames.length,
                              ),
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
    List<BrandModel> categoryItems,
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
                      Container(
                        width: 374.w,
                        height: 467.h,
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
                              StatefulBuilder(
                                builder: (context, setState) {
                                  return Expanded(
                                    child: GridView.builder(
                                      scrollDirection: Axis.vertical,
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
                                        final isSelected =
                                            filterModel.brandIndex == index;

                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              12.r,
                                            ),
                                            border:
                                                isSelected
                                                    ? Border.all(
                                                      color:
                                                          ColorManager.primary,
                                                      width: 3,
                                                    )
                                                    : null,
                                          ),
                                          child: CategoryAndBrandItem(
                                            text: brand.name,
                                            imagePath: brand.imagePath,
                                            onTap: () {
                                              setState(() {
                                                filterModel.brandIndex =
                                                    isSelected ? null : index;
                                                filterModel.brandName =
                                                    isSelected
                                                        ? null
                                                        : brand.name;
                                              });
                                              print(index);
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 10.h),
                              DefaultElevatedButton(
                                backGroundColor: ColorManager.white,
                                textColor: ColorManager.primary,

                                onPressed: () {
                                  print('show all');
                                },
                                text: 'عرض الكل',
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        height: 243.h,
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
                                  builder:
                                      (
                                        context,
                                        setState,
                                      ) => SingleChildScrollView(
                                        child: Wrap(
                                          spacing: 8.w,
                                          runSpacing: 8.h,
                                          alignment: WrapAlignment.start,
                                          children:
                                              modelsNames.map((model) {
                                                final isSelected =
                                                    filterModel.modelName ==
                                                    model;
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      filterModel.modelName =
                                                          isSelected
                                                              ? null
                                                              : model;
                                                    });
                                                    print(model);
                                                  },
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 8.h,
                                                          horizontal: 12.w,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: ColorManager.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8.r,
                                                          ),
                                                      border:
                                                          isSelected
                                                              ? Border.all(
                                                                color:
                                                                    ColorManager
                                                                        .primary,
                                                                width: 3,
                                                              )
                                                              : null,
                                                    ),
                                                    child: Text(
                                                      model,
                                                      style:
                                                          StylesManager.getBoldStyle(
                                                            color:
                                                                ColorManager
                                                                    .black,
                                                            fontSize:
                                                                FontSize.s14,
                                                          ),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                        ),
                                      ),
                                ),
                              ),
                              SizedBox(height: 10.h),

                              DefaultElevatedButton(
                                backGroundColor: ColorManager.white,
                                textColor: ColorManager.primary,

                                onPressed: () {
                                  print('show all');
                                },
                                text: 'عرض الكل',
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: 374.w,
                        height: 467.h,
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
                                child: StatefulBuilder(
                                  builder:
                                      (context, setState) => GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 8.w,
                                              mainAxisSpacing: 8.h,
                                              mainAxisExtent: 111.h,
                                            ),
                                        itemBuilder: (context, index) {
                                          final category = categoryItems[index];
                                          final isSelected =
                                              filterModel.categoryIndex ==
                                              index;
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              border:
                                                  isSelected
                                                      ? Border.all(
                                                        color:
                                                            ColorManager
                                                                .primary,
                                                        width: 3,
                                                      )
                                                      : null,
                                            ),
                                            child: CategoryAndBrandItem(
                                              onTap: () {
                                                setState(() {
                                                  filterModel.categoryIndex =
                                                      isSelected ? null : index;
                                                  filterModel.categoryName =
                                                      isSelected
                                                          ? null
                                                          : category.name;
                                                });

                                                Future.delayed(
                                                  const Duration(
                                                    milliseconds: 50,
                                                  ),
                                                  () {
                                                    filterModel.year == null;
                                                    onTapCategoryAndBrandItem(
                                                      context,
                                                      filterModel,
                                                      modelsNames,
                                                    );
                                                  },
                                                );
                                              },
                                              text: category.name,
                                              imagePath: category.imagePath,
                                            ),
                                          );
                                        },
                                        itemCount: categoryItems.length,
                                      ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              DefaultElevatedButton(
                                backGroundColor: ColorManager.white,
                                textColor: ColorManager.primary,

                                onPressed: () {
                                  print('show all');
                                },
                                text: 'عرض الكل',
                              ),
                            ],
                          ),
                        ),
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
