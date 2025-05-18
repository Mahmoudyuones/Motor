import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';

class ProductCard extends StatefulWidget {
  final String imagePath;
  final String category;
  final String tag;
  final int views;
  final String productName;
  final double oldPrice;
  final double newPrice;
  final void Function() onShare;
  final VoidCallback onFavorite;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.category,
    required this.tag,
    required this.views,
    required this.productName,
    required this.oldPrice,
    required this.newPrice,
    required this.onShare,
    required this.onFavorite,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      height: 157.h,
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 280.w,
            height: 147.h,
            decoration: BoxDecoration(
              color: ColorManager.backGroundWhite,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    widget.imagePath,
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 8.r,
                  right: 8.r,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: widget.onShare,
                        child: Container(
                          width: 30.w,
                          height: 30.h,
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                            size: 20.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),

          Row(
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
                    '${widget.tag}',
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

          SizedBox(height: 4.h),

          Text(
            widget.productName,
            style: StylesManager.getBoldStyle(
              color: ColorManager.black,
              fontSize: FontSize.s17,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: 4.h),

          Row(
            children: [
              Text(
                '${widget.newPrice.toStringAsFixed(0)} ر.ي',
                style: StylesManager.getSemiBoldStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s16,
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
    );
  }
}
