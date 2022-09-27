import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/core/router/app_router.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/gen/fonts.gen.dart';
import 'package:watchn/utils/widget/const_appbar.dart';
import 'package:watchn/utils/widget/custom_button.dart';
import 'package:watchn/utils/widget/custom_text.dart';
import 'package:watchn/utils/widget/otp_textfield.dart';

class Confir extends StatefulWidget {
  const Confir({Key? key}) : super(key: key);

  @override
  State<Confir> createState() => _ConfirState();
}

class _ConfirState extends State<Confir> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Const.kBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Constappbar(context).appBar(title: Strings.confirmation),
            SizedBox(height: 45.h),
            Assets.images.verifycode.svg(fit: BoxFit.fill),
            SizedBox(height: 40.h),
            CustomText(
              text: Strings.confircode,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: Const.kBlue,
            ),
            SizedBox(height: 5.h),
            CustomText(
              text: Strings.inboxCheck,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: Const.kBlue,
            ),
            SizedBox(height: 69.h),
            RoundedWithShadow(),
            SizedBox(height: 25.h),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRouter.allowcontact, (route) => false);
              },
              child: ConstRegisterButton(
                text: Strings.continuee,
                radius: 32,
                mainColor: Const.kBlue,
                shadowColor: Const.kBoxshadow,
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: Strings.didntGetotp,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Const.kPerple,
                ),
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.only(
                    bottom: 2.r,
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Const.kBlue1,
                    width: 1.0,
                  ))),
                  child: Text(
                    Strings.resendOtp,
                    style: TextStyle(
                      color: Const.kBlue,
                      fontSize: 18.sp,
                      fontFamily: FontFamily.helveticaNowDisplay,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h)
          ],
        ),
      ),
    ));
  }
}
