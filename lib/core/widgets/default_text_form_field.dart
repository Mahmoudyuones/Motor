import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';

class DefaultTextFormField extends StatefulWidget {
  final String hintText;
  final IconData? icon;
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: StylesManager.getRegularStyle(
        color: ColorManager.black,
        fontSize: FontSize.s17,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure ? Icons.visibility_off : Icons.visibility,
                    color: ColorManager.black,
                  ),
                )
                : null,
        prefixIcon:
            widget.icon == null
                ? null
                : Icon(widget.icon, color: ColorManager.black),
        filled: true,
        fillColor: ColorManager.white,
        hintStyle: StylesManager.getBoldStyle(
          color: ColorManager.darkGrey,
          fontSize: FontSize.s14,
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
    );
  }
}
