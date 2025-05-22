import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';

class DefaultTextFormField extends StatefulWidget {
  final String hintText;
  final IconData? icon;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isSearch;
  final String? Function(String?)? validator;
  final bool isPassword;
  final TextEditingController controller;

  const DefaultTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    this.validator,
    required this.isPassword,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isSearch = false,
    this.onTap,
    this.onChanged,
  });

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late bool isObscure = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscureText: isObscure,
      controller: widget.controller,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: StylesManager.getSemiBoldStyle(
        color: ColorManager.black,
        fontSize: FontSize.s17,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        prefixIconConstraints: BoxConstraints(
          minWidth: 42.w,
          minHeight: 42.h,
          maxWidth: 42.w,
          maxHeight: 42.h,
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: 50.w,
          minHeight: 42.h,
          maxWidth: 50.w,
          maxHeight: 42.h,
        ),
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        filled: true,
        fillColor: ColorManager.white,
        hintStyle: StylesManager.getBoldStyle(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide:
              widget.isSearch
                  ? BorderSide.none
                  : BorderSide(color: Colors.black, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide:
              widget.isSearch
                  ? BorderSide.none
                  : BorderSide(color: Colors.black, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide:
              widget.isSearch
                  ? BorderSide.none
                  : BorderSide(color: ColorManager.black, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide:
              widget.isSearch
                  ? BorderSide.none
                  : BorderSide(color: ColorManager.primary, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide:
              widget.isSearch
                  ? BorderSide.none
                  : BorderSide(color: ColorManager.primary, width: 1),
        ),
      ),
    );
  }
}
