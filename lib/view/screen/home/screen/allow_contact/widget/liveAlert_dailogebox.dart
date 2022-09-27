import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/utils/widget/custom_text.dart';
import 'package:watchn/view/screen/home/screen/allow_contact/widget/view_location.dart';

class LiveDailogeAlert extends StatefulWidget {
  const LiveDailogeAlert({Key? key}) : super(key: key);

  @override
  State<LiveDailogeAlert> createState() => _LiveDailogeAlertState();
}

class _LiveDailogeAlertState extends State<LiveDailogeAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      contentPadding: const EdgeInsets.only(top: 10.0),
      content: SizedBox(
        width: 354.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 20.h),
            CustomText(
              text:
                  'Incident in progress nearby, click\n here to find the location',
              color: Const.kBlue,
              textAlign: TextAlign.center,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.only(left: 30.r, right: 30.r),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 65.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xff5FC37B), Color(0xff0F9D58)]),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/eye.svg',
                              height: 20.h, width: 30.w),
                          SizedBox(width: 10.w),
                          CustomText(
                            text: 'View Live Now',
                            color: Const.kWhite,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ViewLocation()));
                    },
                    child: Container(
                      height: 65.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffE8B00C),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icon/location.svg',
                              width: 30.w, height: 21.h),
                          SizedBox(width: 10.w),
                          CustomText(
                            text: 'View Location',
                            color: Const.kWhite,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 65.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xffFF0404), Color(0xffDD0000)]),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icon/close.svg',
                              width: 19.w, height: 19.h),
                          SizedBox(width: 10.w),
                          CustomText(
                            text: 'Cancel',
                            color: Const.kWhite,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 37.h)
          ],
        ),
      ),
    );
  }
}
