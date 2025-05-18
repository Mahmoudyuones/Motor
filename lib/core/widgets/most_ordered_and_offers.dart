import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';

class MostOrderedAndOffers extends StatefulWidget {
  final String title;
  final List<Widget> items;
  const MostOrderedAndOffers({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  State<MostOrderedAndOffers> createState() => _MostOrderedAndOffersState();
}

class _MostOrderedAndOffersState extends State<MostOrderedAndOffers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
      height: 315.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: StylesManager.getBoldStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s18,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        'عرض الكل  ',
                        style: StylesManager.getSemiBoldStyle(
                          color: ColorManager.primary,
                          fontSize: FontSize.s16,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: ColorManager.primary,
                        size: 20.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return widget.items[index];
                },
                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                itemCount: widget.items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
