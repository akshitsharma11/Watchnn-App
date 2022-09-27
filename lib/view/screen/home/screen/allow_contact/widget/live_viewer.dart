import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/utils/widget/custom_text.dart';

class LiveViewer extends StatelessWidget {
  const LiveViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.r, vertical: 6.r),
      child: Row(
        children: [
          Assets.images.yash.image(),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: Strings.userid,
                fontSize: 14.sp,
                color: Const.kWhite,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                text: Strings.usercomment,
                fontSize: 14.sp,
                color: Const.kWhite,
                fontWeight: FontWeight.w500,
              ),
            ],
          )
        ],
      ),
    );
  }
}
