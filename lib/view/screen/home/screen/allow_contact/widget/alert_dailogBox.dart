import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/gen/fonts.gen.dart';
import 'package:watchn/utils/widget/custom_text.dart';

class AlertDailog extends StatefulWidget {
  const AlertDailog({Key? key}) : super(key: key);

  @override
  State<AlertDailog> createState() => _AlertDailogState();
}

class _AlertDailogState extends State<AlertDailog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      contentPadding: const EdgeInsets.only(top: 10.0),
      content: SizedBox(
        width: 354.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 25.h),
            CustomText(
              text: Strings.aalowcon,
              color: Const.kBlue,
              textAlign: TextAlign.center,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 30.h),
            CustomText(
              text: Strings.byallow,
              color: Const.kPerple3,
              textAlign: TextAlign.center,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            CustomText(
              text: Strings.weuse,
              textAlign: TextAlign.center,
              color: Const.kPerple3,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 25.h),
            Divider(
              color: Const.kInnerborder,
              thickness: 1.0,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: CustomText(
                  text: Strings.allowaccess,
                  color: Const.kblue1,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                )),
            Divider(
              color: Const.kInnerborder,
              thickness: 1.0,
            ),
            TextButton(
                onPressed: () {},
                child: CustomText(
                  text: Strings.dontallow,
                  color: const Color(0xffFF4D4D),
                  fontFamily: FontFamily.helveticaNowDisplay,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(height: 12.h)
          ],
        ),
      ),
    );
  }
}
