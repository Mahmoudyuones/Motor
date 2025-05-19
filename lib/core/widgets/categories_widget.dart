import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/models/filter_model.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/category_and_brand_item.dart';
import 'package:motor/features/filteration/filter_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CategoriesWidget extends StatefulWidget {
  final List<String> modelsNames;
  const CategoriesWidget({super.key, required this.modelsNames});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  final PageController _pageController = PageController();
  final List<String> brandListPaths = List.generate(
    18,
    (index) => 'assets/images/brand_image.png',
  );
  final List<String> categoryListPaths = List.generate(
    18,
    (index) => 'assets/images/category_image.png',
  );
  int selectedIndex = 0;

  List<List<String>> _paginate(List<String> items, int itemsPerPage) {
    List<List<String>> pages = [];
    for (var i = 0; i < items.length; i += itemsPerPage) {
      pages.add(
        items.sublist(
          i,
          i + itemsPerPage > items.length ? items.length : i + itemsPerPage,
        ),
      );
    }
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    final items = selectedIndex == 0 ? categoryListPaths : brandListPaths;
    final pagedItems = _paginate(items, 6);
    final textLabel = selectedIndex == 0 ? 'اسم القسم' : 'اسم الماركة';

    return Container(
      width: 370.w,
      height: 360.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: ColorManager.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'فلتره بحسب',
                    style: StylesManager.getBoldStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s18,
                    ),
                  ),
                  Container(
                    width: 133.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: ColorManager.black,
                    ),
                    child: AnimatedToggleSwitch<int>.size(
                      current: selectedIndex,
                      values: const [0, 1],
                      iconOpacity: 1.0,
                      indicatorSize: Size(60.w, 35.h),
                      iconBuilder: (value) {
                        final isSelected = selectedIndex == value;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              value == 0 ? 'الاقسام' : 'الماركات',
                              style: StylesManager.getSemiBoldStyle(
                                color:
                                    isSelected
                                        ? ColorManager.white
                                        : ColorManager.black,
                                fontSize: FontSize.s10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                      borderWidth: 0.0,
                      iconAnimationType: AnimationType.onHover,
                      style: ToggleStyle(
                        backgroundColor: ColorManager.backGroundRed,
                        borderRadius: BorderRadius.circular(8.r),
                        indicatorColor: ColorManager.primary,
                      ),
                      onChanged: (i) {
                        setState(() {
                          selectedIndex = i;
                          _pageController.jumpToPage(0);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            Container(
              width: 354.w,
              height: 265.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: ColorManager.backGroundWhite,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.h, vertical: 8.h),
                child: Column(
                  children: [
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: SizedBox(
                          key: ValueKey<int>(selectedIndex),
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: pagedItems.length,
                            itemBuilder: (context, pageIndex) {
                              final page = pagedItems[pageIndex];
                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 8.w,
                                      mainAxisSpacing: 8.h,
                                      mainAxisExtent: 111.h,
                                    ),
                                itemCount: page.length,
                                itemBuilder: (context, index) {
                                  return CategoryAndBrandItem(
                                    onTap: () {
                                      if (selectedIndex == 0) {
                                        FilterScreen()
                                            .onTapCategoryAndBrandItem(
                                              context,
                                              FilterModel(),
                                              widget.modelsNames,
                                            );
                                      }
                                    },
                                    text: textLabel,
                                    imagePath: page[index],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: pagedItems.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: ColorManager.primary,
                        dotColor: ColorManager.grey,
                        dotHeight: 8.h,
                        dotWidth: 8.w,
                        spacing: 4.w,
                      ),
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
