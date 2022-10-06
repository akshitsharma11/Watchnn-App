import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/utils/widget/custom_text.dart';
import 'package:watchn/view/screen/home/screen/all_incidents/widget/video_player.dart';

class AllIncidents extends StatefulWidget {
  const AllIncidents({Key? key}) : super(key: key);

  @override
  State<AllIncidents> createState() => _AllIncidentsState();
}

class _AllIncidentsState extends State<AllIncidents> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Const.kBackground,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              Center(
                child: CustomText(
                  text: Strings.pastincident,
                  color: Const.kBlue,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                height: 818.h,
                width: MediaQuery.of(context).size.width,
                color: Const.kWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.r, horizontal: 24.r),
                      child: CustomText(
                        text: Strings.myincidents,
                        color: Const.kBlue,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10.h),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
