import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';

class ImageShower extends StatefulWidget {
  final List<String> images;
  const ImageShower({super.key, required this.images});

  @override
  State<ImageShower> createState() => _ImageShowerState();
}

class _ImageShowerState extends State<ImageShower> {
  final PageController _controller = PageController();
  int _currentPage = 0;

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
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return Image.asset(widget.images[index], fit: BoxFit.cover);
              },
            ),
            Positioned(
              bottom: 10.h,
              right: 10.w,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: ColorManager.white.withOpacity(0.5),
                  border: Border.all(
                    color: ColorManager.white.withOpacity(0.5),
                    width: 3.w,
                  ),
                ),
                child: Row(
                  children: List.generate(
                    widget.images.length,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      width: _currentPage == index ? 30.w : 12.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color:
                            _currentPage == index
                                ? ColorManager.primary
                                : ColorManager.grey,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
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
