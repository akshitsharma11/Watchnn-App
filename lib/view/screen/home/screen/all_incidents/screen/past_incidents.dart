import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/utils/widget/const_appbar.dart';
import 'package:watchn/utils/widget/custom_text.dart';
import 'package:watchn/view/screen/home/screen/all_incidents/screen/video_player_screen.dart';

class PastIncidents extends StatefulWidget {
  PastIncidents({Key? key, this.controller}) : super(key: key);
  VideoPlayerController? controller;
  @override
  State<PastIncidents> createState() => _PastIncidentsState();
}

class _PastIncidentsState extends State<PastIncidents> {
  final double _userRating = 4.5;
  final double _userRating1 = 3.5;
  final double _userRating2 = 5;
  IconData? _selectedIcon;
  final bool _isVertical = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.kBackground,
      appBar: Constappbar(context).appBar(title: Strings.mypastincident),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Stack(
              children: [
                SizedBox(
                  height: 291,
                  width: MediaQuery.of(context).size.width,
                  child: AspectRatio(
                    aspectRatio: widget.controller!.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        VideoPlayer(widget.controller!),
                        ClosedCaption(
                            text: widget.controller!.value.caption.text),
                        VideoProgressIndicator(widget.controller!,
                            allowScrubbing: true),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 291,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 13.r,
                          top: 8.r,
                        ),
                        child: Row(
                          children: [
                            Assets.images.yash.image(width: 45.w, height: 45.h),
                            SizedBox(width: 4.w),
                            CustomText(
                              text: 'Hijbullah',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color: Const.kWhite,
                            ),
                            const Spacer(),
                            CustomText(
                              text: '29 July 2021',
                              color: Const.kWhite,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(8),
                              ),
                              child: Assets.icon.close.svg(
                                  height: 12.h,
                                  width: 12.w,
                                  color: Const.kWhite),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return VideoPlayScreen(
                                controller: widget.controller,
                              );
                            },
                          ));
                        },
                        child: const Center(
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 50.0,
                            semanticLabel: 'Play',
                          ),
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.only(left: 28.r, right: 10.r),
                        child: Row(
                          children: [
                            CustomText(
                              text: 'Details Officer ${index + 1}',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color: Const.kBlue,
                            ),
                            SizedBox(width: 13.w),
                            Expanded(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: const Divider(
                                  color: Color(0xffCDD2E4),
                                  thickness: 1.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.r),
                        child: SvgPicture.asset(
                            'assets/images/policeoffice.svg',
                            color: Const.kBlack),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 29.r, vertical: 18.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomText(
                                  text: 'Name:',
                                  color: Const.kTitle,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(width: 3.w),
                                CustomText(
                                  text: 'john doe',
                                  color: Const.kBlue,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                CustomText(
                                  text: 'Badge Number:',
                                  color: Const.kTitle,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(width: 3.w),
                                CustomText(
                                  text: '1856',
                                  color: Const.kBlue,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                CustomText(
                                  text: 'Station:',
                                  color: Const.kTitle,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(width: 3.w),
                                CustomText(
                                  text: 'SFPD Park Police Station',
                                  color: Const.kBlue,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 28.r, right: 10.r),
                        child: Row(
                          children: [
                            CustomText(
                              text: Strings.review,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color: Const.kBlue,
                            ),
                            SizedBox(width: 13.w),
                            Expanded(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: const Divider(
                                  color: Color(0xffCDD2E4),
                                  thickness: 1.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 29.r, vertical: 18.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomText(
                                  text: Strings.politness,
                                  color: Const.kTitle,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(width: 10.w),
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
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                CustomText(
                                  text: Strings.aggression,
                                  color: Const.kTitle,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(width: 10.w),
                                RatingBarIndicator(
                                  rating: _userRating1,
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
                                    text: '(3.5',
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
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                CustomText(
                                  text: 'Helpful',
                                  color: Const.kTitle,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(width: 10.w),
                                RatingBarIndicator(
                                  rating: _userRating2,
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
                                    text: '(5',
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
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                CustomText(
                                  text: 'Total:',
                                  color: Const.kTitle,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(width: 10.w),
                                CustomText(
                                  text: '4.0* Out of 5.0',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Const.kBlue,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 28.r, right: 10.r),
                        child: Row(
                          children: [
                            CustomText(
                              text: 'My Comment',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color: Const.kBlue,
                            ),
                            SizedBox(width: 13.w),
                            Expanded(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: const Divider(
                                  color: Color(0xffCDD2E4),
                                  thickness: 1.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 9.h),
                      Padding(
                        padding: EdgeInsets.only(left: 28.r),
                        child: CustomText(
                          text: Strings.mycomments,
                          fontSize: 20.sp,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w400,
                          color: Const.kBlue,
                        ),
                      ),
                      SizedBox(height: 30.h)
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
