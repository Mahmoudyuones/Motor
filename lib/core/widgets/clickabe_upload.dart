import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';

class ClickableIdUpload extends StatelessWidget {
  const ClickableIdUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // <-- Center the entire upload box
      child: GestureDetector(
        onTap: () {},
        child: DottedBorder(
          color: ColorManager.primary,
          strokeWidth: 1,
          dashPattern: const [6, 4],
          borderType: BorderType.RRect,
          radius: Radius.circular(12.r),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "المس لإضافة صور الهوية (اختياري)",
                        textAlign: TextAlign.right,
                        style: StylesManager.getBoldStyle(
                          color: ColorManager.primary,
                          fontSize: FontSize.s14,
                        ),
                      ),
                      Text(
                        "صورة للهوية الشخصية من الامام والخلف",
                        textAlign: TextAlign.right,
                        style: StylesManager.getBoldStyle(
                          color: ColorManager.primary,
                          fontSize: FontSize.s12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ColorManager.backGroundRed,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Icon(Icons.add, color: ColorManager.primary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
