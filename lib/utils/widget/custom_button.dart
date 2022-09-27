import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/gen/fonts.gen.dart';

class ConstRegisterButton extends StatelessWidget {
  const ConstRegisterButton({
    Key? key,
    this.text,
    this.radius,
    this.mainColor,
    this.shadowColor,
    this.style,
    this.onTap,
  }) : super(key: key);
  final String? text;
  final Function()? onTap;
  final Color? mainColor;
  final Color? shadowColor;
  final double? radius;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300.w,
        height: 60.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius!),
            gradient: const LinearGradient(
              colors: [
                Color(0xff383A7D),
                Color(0xff15175A),
              ],
            ),
            boxShadow: [
              BoxShadow(
                  color: shadowColor!,
                  spreadRadius: -10,
                  offset: const Offset(0, 25),
                  blurRadius: 25)
            ]),
        child: Center(
          child: Text(
            text!,
            style: style ??
                Const.bold.copyWith(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontFamily: FontFamily.helveticaNowDisplay,
                    fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
