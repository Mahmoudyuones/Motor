import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SearchItem extends StatefulWidget {
  final List<String> imagePaths;
  final String category;
  final String tag;
  final String views;
  final String productName;
  final double oldPrice;
  final double newPrice;
  final void Function() onShare;
  final VoidCallback onFavorite;
  const SearchItem({
    super.key,
    required this.imagePaths,
    required this.onShare,
    required this.onFavorite,
    required this.category,
    required this.tag,
    required this.views,
    required this.productName,
    required this.oldPrice,
    required this.newPrice,
  });

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  final PageController _pageController = PageController();
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,

      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0.h),
        child: Column(
          children: [
            Container(
              width: 346.w,
              height: 195.h,
              decoration: BoxDecoration(
                color: ColorManager.backGroundWhite,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: widget.imagePaths.length,
                    itemBuilder:
                        (context, index) => Center(
                          child: Image.asset(
                            widget.imagePaths[index],
                            width: 150.w,
                            height: 120.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                  ),
                  Positioned(
                    top: 8.r,
                    right: 8.r,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: widget.onShare,
                          child: Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Image.asset(
                              "assets/icons/Share.png",

                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.grey,
                              size: 30.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    bottom: 8.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: widget.imagePaths.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: ColorManager.primary,
                          dotColor: ColorManager.backGroundRed,
                          dotHeight: 8.h,
                          dotWidth: 12.w,
                          spacing: 4.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.category,
                    style: StylesManager.getSemiBoldStyle(
                      color: ColorManager.grey,
                      fontSize: FontSize.s14,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.tag,
                        style: StylesManager.getSemiBoldStyle(
                          color: ColorManager.grey,
                          fontSize: FontSize.s14,
                        ),
                      ),
                      SizedBox(width: 8.w),

                      Text(
                        'مشاهدة ${widget.views}',
                        style: StylesManager.getSemiBoldStyle(
                          color: ColorManager.grey,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 4.h),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.productName,
                style: StylesManager.getBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s20,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            SizedBox(height: 4.h),

            Row(
              children: [
                Text(
                  '${widget.newPrice.toStringAsFixed(0)} ر.ي',
                  style: StylesManager.getSemiBoldStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s18,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  '${widget.oldPrice.toStringAsFixed(0)} ر.ي',
                  style: TextStyle(
                    fontFamily: FontConstants.fontFamily,
                    fontSize: 15.sp,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
