import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/gen/fonts.gen.dart';
import 'package:watchn/utils/widget/custom_text.dart';
import 'package:watchn/view/screen/home/screen/all_incidents/widget/video_player.dart';
import 'package:watchn/view/screen/home/screen/dashboard.dart';

class FeedHome extends StatefulWidget {
  const FeedHome({
    Key? key,
  }) : super(key: key);

  @override
  State<FeedHome> createState() => _FeedHomeState();
}

class _FeedHomeState extends State<FeedHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Const.kBackground,
        appBar: PreferredSize(
            preferredSize: const Size(1, 60),
            child: Center(
              child: CustomText(
                text: Strings.home,
                color: Const.kBlue,
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Container(
                height: 159.h,
                width: MediaQuery.of(context).size.width,
                color: Const.kWhite,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 9.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: Strings.friendsincidents,
                        color: Const.kBlue,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 15.h),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return const Live_incidents_widget();
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(width: 9.w);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                height: 201.h,
                width: MediaQuery.of(context).size.width,
                color: Const.kWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: CustomText(
                            text: Strings.myincidents,
                            color: Const.kBlue,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DashBoard(selectedIndex: 2)));
                          },
                          child: Text(
                            Strings.seeAll,
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(width: 10.w)
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const VideoPlayerWidget();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.h),
              Assets.images.police.image(),
              Padding(
                padding: EdgeInsets.only(top: 14.h, left: 25.w),
                child: Row(
                  children: [
                    Assets.icon.like.svg(height: 20, width: 22),
                    SizedBox(width: 17.w),
                    Assets.icon.comment.svg(height: 20, width: 22),
                    SizedBox(width: 17.w),
                    Assets.icon.share.svg(height: 20, width: 22),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 19.w, right: 19.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomText(
                      text: Strings.likes,
                      color: Const.kPerple1,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'houseofhighlights ',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Const.kBlue),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'THAT WAS CLOSE, ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: Color(0xff8D93C9))),
                          TextSpan(
                              text: '@michael_burrell2',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                  color: Color(0xff8D93C9))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    CustomText(
                      text: Strings.viewall,
                      color: Const.kPerple1,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    CustomText(
                      text: Strings.yungmiilan,
                      color: Const.kBlue,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    CustomText(
                      text: Strings.simply,
                      color: Const.kBlue,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomText(
                      text: '14 HOURS AGO',
                      color: Const.kBlue,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                        height: 53.h,
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xffEEEFFC),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 15.r,
                            right: 15.r,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.icon.smile.svg(),
                              SizedBox(width: 8.w),
                              CustomText(
                                text: 'Add a Comment...',
                                color: Const.kPerple,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              const Spacer(),
                              TextButton(
                                  onPressed: () {},
                                  child: CustomText(
                                    text: 'Post',
                                    color: Const.kblue1,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w800,
                                  ))
                            ],
                          ),
                        )),
                    // SizedBox(height: 30.h),
                    // Container(
                    //   height: 53.h,
                    //   width: MediaQuery.of(context).size.width,
                    //   color: const Color(0xffEEEFFC),
                    //   child: TextFormField(
                    //     textAlign: TextAlign.left,
                    //     autofocus: false,
                    //     autovalidateMode: AutovalidateMode.disabled,
                    //     keyboardType: TextInputType.name,
                    //     style: TextStyle(
                    //         fontSize: 17.sp,
                    //         color: Const.kBlue,
                    //         fontFamily: FontFamily.helveticaNowDisplay),
                    //     decoration: InputDecoration(
                    //       filled: true,
                    //       fillColor: Colors.transparent,
                    //       hintText: 'Add a Comment...',
                    //       alignLabelWithHint: false,
                    //       labelText: 'Add a Comment...',
                    //       labelStyle:
                    //           TextStyle(fontSize: 17.sp, color: Const.kBlue),
                    //       hintStyle: TextStyle(
                    //           color: Const.kPerple,
                    //           fontSize: 16.sp,
                    //           fontWeight: FontWeight.w400,
                    //           fontFamily: FontFamily.helveticaNowDisplay),
                    //
                    //       prefixIcon: Padding(
                    //         padding: const EdgeInsets.only(right: 10.0),
                    //         child: SizedBox(height: 0.h, width: 0.w),
                    //       ),
                    //       suffixIcon: SizedBox(height: 0.h, width: 0.w),
                    //       // contentPadding:
                    //       //     conttentPad ?? const EdgeInsets.symmetric(horizontal: 20),
                    //       enabledBorder: UnderlineInputBorder(
                    //         borderSide: BorderSide(color: Const.kInnerborder),
                    //       ),
                    //       focusedBorder: UnderlineInputBorder(
                    //         borderSide: BorderSide(color: Const.kInnerborder),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Live_incidents_widget extends StatelessWidget {
  const Live_incidents_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: 58.h,
          // width: 58.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              gradient: LinearGradient(
                  colors: [Const.kblue1, Const.kBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
                width: 54.w,
                height: 54.h,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.deepOrange),
                child: Assets.images.liveincident.image()),
          ),
        ),
        SizedBox(height: 6.h),
        CustomText(
          text: Strings.ulmavidesiqn,
          color: Const.kBlue,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        )
      ],
    );
  }
}
