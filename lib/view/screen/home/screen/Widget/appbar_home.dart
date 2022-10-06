import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/gen/assets.gen.dart';

class AppbarHome {
  final BuildContext context;

  AppbarHome(this.context);

  bool isChecked = false;

  appbarhome({
    String? text,
    Function()? onTap,
    final double? height,
    final double? width,
    String? image,
    double? h,
    double? w,
    bool? isCheckbox = false,
    bool? isSelectAll = false,
    TextStyle? style,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: () {
                SystemNavigator.pop();
              },
              child: Assets.icon.backarrow.svg(fit: BoxFit.fill)),
          SizedBox(width: 20.w),
          Column(
            children: [
              SvgPicture.asset('assets/icon/watchnlogo.svg',
                  height: 27, width: 67),
              SvgPicture.asset('assets/icon/watchntext.svg',
                  height: 22, width: 67),
            ],
          ),
          SizedBox(width: 30.r),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff15175A), Color(0xff383A7D)],
                  ),
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                        color: Const.kBoxshadow,
                        spreadRadius: -10,
                        offset: const Offset(0, 25),
                        blurRadius: 25)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isSelectAll!
                      ? SvgPicture.asset(
                          image!,
                          height: h,
                          width: w,
                        )
                      : const SizedBox(
                          height: 0.0,
                        ),
                  isCheckbox!
                      ? SizedBox(
                          width: 25.w,
                          child: Transform.scale(
                            scale: 0.7,
                            child: Checkbox(
                              activeColor: Const.kWhite,
                              checkColor: Const.kBlue,
                              side: BorderSide(color: Const.kWhite, width: 2),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(2, 2))),
                              value: isChecked,
                              onChanged: (value) {
                                isChecked = !isChecked;
                                // setState(() {});
                              },
                            ),
                          ),
                        )
                      : const SizedBox(height: 0.0),
                  isSelectAll
                      ? SizedBox(width: 8.w)
                      : const SizedBox(height: 0.0),
                  Text(
                    text!,
                    style: style ??
                        Const.bold.copyWith(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
