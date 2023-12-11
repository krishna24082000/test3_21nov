import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../values/app_color.dart';

class BaseTextFormField extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final String? hintText;
  TextStyle? hintTextStyle;
  TextStyle? textStyle;
  Color? cursorColor;
  Color? fillColor;
  InputDecoration? decoration;
  final TextEditingController? controller;
  final GestureTapCallback? onTap;
  final Widget? prefix;
  final Widget? suffix;
  final bool read;

  BaseTextFormField(
      {super.key,
      this.validator,
      this.hintText,
      this.hintTextStyle,
      this.textStyle,
      this.cursorColor,
      this.fillColor,
      this.decoration,
      this.controller,
      this.onTap,
      this.prefix,
      this.suffix,
      required this.read});

  @override
  State<BaseTextFormField> createState() => _BaseTextFormFieldState();
}

class _BaseTextFormFieldState extends State<BaseTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: widget.textStyle,
      onTap: widget.onTap,
      validator: widget.validator,
      readOnly: widget.read,
      decoration: InputDecoration(
        errorStyle: TextStyle(
            color: AppColor.red,
            fontSize: 12.sp,
            fontFamily: "yeseva",
            fontWeight: FontWeight.w500),
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: AppColor.hintColor,
            fontFamily: "cabin",
            fontSize: 14.sp,
            fontWeight: FontWeight.w400),
        fillColor: AppColor.white,
        suffixIcon: widget.suffix,
        prefixIcon: widget.prefix,
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColor.maroon),
          borderRadius: BorderRadius.circular(20).r,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20).r,
          borderSide: BorderSide(width: 2, color: AppColor.maroon),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20).r,
          borderSide: BorderSide(width: 2, color: AppColor.maroon),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20).r,
          borderSide: BorderSide(width: 2, color: AppColor.maroon),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColor.maroon),
          borderRadius: BorderRadius.circular(20).r,
        ),
      ),
    );
  }
}
