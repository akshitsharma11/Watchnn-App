import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/gen/fonts.gen.dart';
import 'package:watchn/utils/widget/custom_button.dart';
import 'package:watchn/view/screen/home/screen/Widget/contact_list_widget.dart';
import 'package:watchn/view/screen/home/screen/allow_contact/widget/alert_dailogBox.dart';
import 'package:watchn/view/screen/home/screen/dashboard.dart';

class AllowContact extends StatefulWidget {
  const AllowContact({Key? key}) : super(key: key);

  @override
  State<AllowContact> createState() => _AllowContactState();
}

class _AllowContactState extends State<AllowContact> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showDialog(
          context: context,
          builder: (BuildContext context) => const AlertDailog());
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    setState(() {});
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          showDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              content: Text(
                "Are you sure you want to exit?",
                style: TextStyle(
                  color: Const.kBlue,
                  fontSize: 17.sp,
                  fontFamily: FontFamily.helveticaNowDisplay,
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text(
                      "no",
                      style: TextStyle(
                        color: Const.kBlue,
                        fontFamily: FontFamily.helveticaNowDisplay,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: Text(
                      "yes",
                      style: TextStyle(
                        color: Const.kBlue,
                        fontFamily: FontFamily.helveticaNowDisplay,
                      ),
                    )),
              ],
            ),
          );
          return Future<bool>(() => true);
        },
        child: Scaffold(
          backgroundColor: Const.kBackground,
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              SizedBox(height: 30.h),
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
                    child: Container(
                      width: 130.w,
                      height: 50.h,
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
                          SizedBox(
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
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                          // SizedBox(width: 8.w),
                          Text(
                            Strings.selectall,
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: Const.kWhite,
                                fontFamily: FontFamily.helveticaNowDisplay),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // AppbarHome(context).appbarhome(
              //     height: 50.h,
              //     width: 130.w,
              //     isCheckbox: true,
              //     text: Strings.selectall,
              //     style: TextStyle(fontSize: 17.sp, color: Const.kWhite),
              //     image: 'assets/icon/rectangle.svg'),
              SizedBox(height: 21.h),
              Container(
                height: 55.h,
                width: 345.w,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Const.kBoxshadow,
                      spreadRadius: -10,
                      offset: const Offset(0, 25),
                      blurRadius: 25)
                ]),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 12.r),
                      hintText: Strings.searchtoadd,
                      hintStyle: TextStyle(
                          fontSize: 18.sp,
                          color: Const.kPerple1,
                          fontWeight: FontWeight.w400),
                      fillColor: Const.kWhite,
                      prefixIcon: Assets.icon.search
                          .svg(fit: BoxFit.none, height: 19.h, width: 21.w),
                      suffixIcon: Assets.icon.mic
                          .svg(fit: BoxFit.none, height: 18.h, width: 25.w),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.0, color: Const.kWhite),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.0, color: Const.kWhite),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.0, color: Const.kWhite),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(32),
                          ))),
                ),
              ),
              SizedBox(height: 21.h),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return const ContactListWidget();
                    }),
              ),
              SizedBox(height: 20.h),
              ConstRegisterButton(
                text: Strings.sent,
                radius: 32,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashBoard()));
                },
                mainColor: Const.kBlue,
                shadowColor: Const.kBoxshadow,
              ),
              SizedBox(height: 30.h)
            ],
          ),
        ),
      ),
    );
  }
}
