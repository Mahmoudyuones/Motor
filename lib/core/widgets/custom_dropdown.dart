import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';

class CustomDropdown extends StatefulWidget {
  final String hintText;
  final List<String> items;
  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.items,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Theme(
        data: Theme.of(context).copyWith(hintColor: ColorManager.darkGrey),
        child: DropdownButtonFormField<String>(
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
          style: StylesManager.getBoldStyle(
            color: ColorManager.darkGrey,
            fontSize: FontSize.s14,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: StylesManager.getBoldStyle(
              color: ColorManager.darkGrey,
              fontSize: FontSize.s14,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.black, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: ColorManager.black, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: ColorManager.primary, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: ColorManager.primary, width: 1),
            ),
          ),
          icon: const Icon(Icons.arrow_drop_down),
          items:
              widget.items.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: StylesManager.getBoldStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s14,
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
