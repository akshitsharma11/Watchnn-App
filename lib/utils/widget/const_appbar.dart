import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/gen/fonts.gen.dart';
import 'package:watchn/utils/widget/custom_text.dart';

class Constappbar {
  final BuildContext context;

  Constappbar(this.context);
  appBar({required String? title, List<Widget>? action}) => AppBar(
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Assets.icon.backarrow.svg(
                fit: BoxFit.cover,
              )),
        ),
        title: CustomText(
          text: title!,
          fontSize: 27.sp,
          fontWeight: FontWeight.w800,
          fontFamily: FontFamily.helveticaNowDisplay,
          color: Const.kBlue,
        ),
        centerTitle: true,
        actions: action,
        elevation: 0,
        backgroundColor: Const.kBackground,
        shadowColor: Colors.transparent,
      );
}
