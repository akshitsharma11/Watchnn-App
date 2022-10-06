import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/gen/fonts.gen.dart';
import 'package:watchn/utils/widget/const_appbar.dart';
import 'package:watchn/utils/widget/const_textfield.dart';
import 'package:watchn/utils/widget/custom_text.dart';
import 'package:watchn/view/screen/home/screen/allow_contact/widget/take_image.dart';
import 'package:watchn/view/screen/home/screen/dashboard.dart';

class ReivewScreen extends StatefulWidget {
  const ReivewScreen({Key? key}) : super(key: key);

  @override
  State<ReivewScreen> createState() => _ReivewScreenState();
}

class _ReivewScreenState extends State<ReivewScreen> {
  int count = 1;
  final double _userRating = 4.5;
  IconData? _selectedIcon;
  final bool _isVertical = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Const.kBackground,
        appBar: Constappbar(context).appBar(title: Strings.review, action: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashBoard()));
              },
              child: CustomText(
                text: Strings.skip,
                color: Const.kBlue,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              )),
        ]),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < count; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25.w, top: 22.h),
                      child: CustomText(
                        text: Strings.reviewncomment,
                        fontSize: 18.sp,
                        color: Const.kBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25.r),
                      child: CustomText(
                        text: Strings.reviewncommentexp,
                        fontSize: 15.sp,
                        color: Const.kPerple,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 26.h),
                    const TakePicture(),
                    SizedBox(height: 25.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.r, right: 20.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Identify',
                            color: Const.kBlue,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 20.h),
                          CustomText(
                            text: Strings.name,
                            color: Const.kTitle,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          RegisterTextField(
                            hint: Strings.nameHint,
                            keyboardType: TextInputType.name,
                            fontSize: 17.sp,
                            hintColor: Const.kBlue,
                          ),
                          SizedBox(height: 20.h),
                          CustomText(
                            text: Strings.badgenumber,
                            color: Const.kTitle,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          RegisterTextField(
                            hint: Strings.badgeHint,
                            keyboardType: TextInputType.number,
                            fontSize: 17.sp,
                            hintColor: Const.kBlue,
                          ),
                          SizedBox(height: 20.h),
                          CustomText(
                            text: Strings.station,
                            color: Const.kTitle,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          RegisterTextField(
                            hint: Strings.stationHint,
                            keyboardType: TextInputType.name,
                            fontSize: 17.sp,
                            hintColor: Const.kBlue,
                          ),
                          SizedBox(height: 30.h),
                          CustomText(
                            text: Strings.review,
                            color: Const.kBlue,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 16.h),
                          CustomText(
                            text: 'Politeness',
                            color: Const.kTitle,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.only(left: 10.r),
                            child: Row(
                              children: [
                                RatingBarIndicator(
                                  rating: _userRating,
                                  itemBuilder: (context, index) => Icon(
                                    _selectedIcon ?? Icons.star,
                                    color: const Color(0xffF4A31E),
                                  ),
                                  itemCount: 5,
                                  itemSize: 18.0,
                                  unratedColor: const Color(0xffB4B9CD),
                                  direction: _isVertical
                                      ? Axis.vertical
                                      : Axis.horizontal,
                                ),
                                SizedBox(width: 10.w),
                                RichWidget(
                                    text: '(4.5',
                                    span: [
                                      TextSpan(
                                          text: '/5)',
                                          style: TextStyle(
                                            color: const Color(0xff5A7090),
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                          ))
                                    ],
                                    style: TextStyle(
                                      color: const Color(0xff5A7090),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.h),
                          CustomText(
                            text: Strings.aggression,
                            color: Const.kTitle,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.only(left: 10.r),
                            child: Row(
                              children: [
                                RatingBarIndicator(
                                  rating: _userRating,
                                  itemBuilder: (context, index) => Icon(
                                    _selectedIcon ?? Icons.star,
                                    color: const Color(0xffF4A31E),
                                  ),
                                  itemCount: 5,
                                  itemSize: 18.0,
                                  unratedColor: const Color(0xffB4B9CD),
                                  direction: _isVertical
                                      ? Axis.vertical
                                      : Axis.horizontal,
                                ),
                                SizedBox(width: 10.w),
                                RichWidget(
                                    text: '(4.5',
                                    span: [
                                      TextSpan(
                                          text: '/5)',
                                          style: TextStyle(
                                            color: const Color(0xff5A7090),
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                          ))
                                    ],
                                    style: TextStyle(
                                      color: const Color(0xff5A7090),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.h),
                          CustomText(
                            text: Strings.providedinfo,
                            color: Const.kTitle,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.only(left: 10.r),
                            child: Row(
                              children: [
                                RatingBarIndicator(
                                  rating: _userRating,
                                  itemBuilder: (context, index) => Icon(
                                    _selectedIcon ?? Icons.star,
                                    color: const Color(0xffF4A31E),
                                  ),
                                  itemCount: 5,
                                  itemSize: 18.0,
                                  unratedColor: const Color(0xffB4B9CD),
                                  direction: _isVertical
                                      ? Axis.vertical
                                      : Axis.horizontal,
                                ),
                                SizedBox(width: 10.w),
                                RichWidget(
                                    text: '(4.5',
                                    span: [
                                      TextSpan(
                                          text: '/5)',
                                          style: TextStyle(
                                            color: const Color(0xff5A7090),
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                          ))
                                    ],
                                    style: TextStyle(
                                      color: const Color(0xff5A7090),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.h),
                          CustomText(
                            text: Strings.comment,
                            color: Const.kBlue,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          RegisterTextField(
                            hint: Strings.commentHint,
                            keyboardType: TextInputType.name,
                            fontSize: 17.sp,
                            hintColor: Const.kBlue,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 45.h),
                  ],
                ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashBoard(
                            selectedIndex: 0,
                          ),
                        ));
                  },
                  child: Container(
                    width: 250.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff383A7D),
                            Color(0xff15175A),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                              color: Const.kshadow,
                              spreadRadius: -10,
                              offset: const Offset(0, 25),
                              blurRadius: 25)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.submit,
                          style: TextStyle(
                              fontSize: 22.sp,
                              fontFamily: FontFamily.helveticaNowDisplay,
                              fontWeight: FontWeight.w800,
                              color: Const.kWhite),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: Container(
                    width: 250.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff383A7D),
                            Color(0xff15175A),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                              color: Const.kshadow,
                              spreadRadius: -10,
                              offset: const Offset(0, 25),
                              blurRadius: 25)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icon/add.svg',
                            color: Const.kWhite, width: 13, height: 13),
                        SizedBox(width: 7.w),
                        Text(
                          'Add',
                          style: TextStyle(
                              fontSize: 22.sp,
                              fontFamily: FontFamily.helveticaNowDisplay,
                              fontWeight: FontWeight.w800,
                              color: Const.kWhite),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h)
            ],
          ),
        ));
  }
}
