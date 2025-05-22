import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageShower extends StatefulWidget {
  final List<String> images;
  const ImageShower({super.key, required this.images});

  @override
  State<ImageShower> createState() => _ImageShowerState();
}

class _ImageShowerState extends State<ImageShower> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: SizedBox(
        height: 157.h,
        width: 370.w,
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,

              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return Image.asset(widget.images[index], fit: BoxFit.fill);
              },
            ),
            Positioned(
              bottom: 10.h,
              right: 10.w,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: ColorManager.white.withOpacity(0.4),
                  border: Border.all(
                    color: ColorManager.white.withOpacity(0.4),
                    width: 3.w,
                  ),
                ),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: widget.images.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: ColorManager.primary,
                    dotColor: ColorManager.grey,
                    dotHeight: 8.h,
                    dotWidth: 10.w,
                    spacing: 4.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
