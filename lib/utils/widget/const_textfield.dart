import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/gen/fonts.gen.dart';

class RegisterTextField extends StatelessWidget {
  RegisterTextField(
      {this.isobs = false,
      this.onChanged,
      this.hintColor,
      this.fontSize,
      this.validator,
      this.controller,
      this.height,
      this.width,
      this.mxline,
      this.labelColor,
      this.onTap,
      this.conttentPad,
      this.validatorFunction,
      Key? key,
      this.keyboardType,
      this.formKey,
      this.sufIcon,
      this.prefIcon,
      this.hint})
      : super(key: key);
  final String? hint;
  final String? validator;
  final Color? hintColor;
  final Color? labelColor;
  final bool? isobs;
  final double? height;
  EdgeInsetsGeometry? conttentPad = const EdgeInsets.all(0);
  final double? width;
  final Widget? prefIcon;
  final Widget? sufIcon;
  TextInputType? keyboardType;
  final double? fontSize;
  int? mxline;
  final TextEditingController? controller;
  void Function(String)? onChanged;
  String? Function(String?)? validatorFunction;
  GlobalKey<FormState>? formKey;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //   height: height ?? 60.h,
      //  width: width ?? 334.w,
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.left,
        autofocus: false,
        validator: validatorFunction != null
            ? validatorFunction!
            : (value) {
                if (value!.isEmpty) {
                  return validator;
                }
              },
        onChanged: onChanged,
        maxLines: mxline ?? 1,
        autovalidateMode: AutovalidateMode.disabled,
        keyboardType: keyboardType,
        obscureText: isobs!,
        onTap: onTap,
        style: TextStyle(
            fontSize: fontSize ?? 17.sp,
            color: Const.kBlue,
            fontFamily: FontFamily.helveticaNowDisplay),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          hintText: hint,
          alignLabelWithHint: false,
          labelText: hint,
          labelStyle:
              TextStyle(fontSize: fontSize ?? 17.sp, color: Const.kBlue),
          hintStyle: Const.medium
              .copyWith(fontSize: fontSize ?? 20.sp, color: hintColor),
          prefixIconConstraints: prefIcon != null
              ? const BoxConstraints(maxWidth: 50)
              : const BoxConstraints.expand(height: 24, width: 21),
          suffixIconConstraints: sufIcon != null
              ? const BoxConstraints.expand(height: 24, width: 40)
              : const BoxConstraints.expand(height: 24, width: 20),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: prefIcon ?? SizedBox(height: 0.h, width: 0.w),
          ),
          suffixIcon: sufIcon ?? SizedBox(height: 0.h, width: 0.w),
          // contentPadding:
          //     conttentPad ?? const EdgeInsets.symmetric(horizontal: 20),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Const.kInnerborder),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Const.kInnerborder),
          ),
        ),
      ),
    );
  }
}
