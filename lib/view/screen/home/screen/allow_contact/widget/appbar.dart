import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/utils/widget/custom_text.dart';

import '../screen/review.dart';

class LiveVideoAppbar extends StatelessWidget {
  const LiveVideoAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 22.r,
        top: 17.r,
        right: 30.r,
      ),
      child: Row(
        children: [
          Assets.images.lorem.svg(),
          SizedBox(width: 7.w),
          CustomText(
            text: 'Full Name',
            color: Const.kWhite,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(width: 30.w),
          CustomText(
            text: '00.00.01',
            color: Const.kWhite,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          const Spacer(),
          Container(
            height: 28.h,
            width: 41.w,
            decoration: BoxDecoration(
                color: const Color(0xffC22E46),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: CustomText(
                text: 'Live',
                color: Const.kWhite,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Container(
            height: 28.h,
            decoration: BoxDecoration(
                color: const Color(0xff202624),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: EdgeInsets.only(left: 4.r, right: 6.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Assets.icon.eye2.svg(height: 4, width: 12),
                        Assets.icon.eye1.svg(height: 4, width: 4),
                      ],
                    ),
                  ),
                  SizedBox(width: 4.w),
                  CustomText(
                    text: '3,631',
                    color: Const.kWhite,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReivewScreen()));
              },
              child: Assets.icon.close.svg(width: 20.w, height: 20.h)),
        ],
      ),
    );
  }
}
