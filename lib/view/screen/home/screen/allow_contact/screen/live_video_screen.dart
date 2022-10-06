import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/view/screen/home/screen/allow_contact/screen/review.dart';
import 'package:watchn/view/screen/home/screen/allow_contact/widget/appbar.dart';
import 'package:watchn/view/screen/home/screen/allow_contact/widget/live_viewer.dart';

class LiveVideo extends StatefulWidget {
  const LiveVideo({Key? key}) : super(key: key);

  @override
  State<LiveVideo> createState() => _LiveVideoState();
}

class _LiveVideoState extends State<LiveVideo> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero, () {
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) => const LiveDailogeAlert());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ReivewScreen()));

          return Future<bool>(() => true);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: [
              Assets.images.livevideo.image(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const LiveVideoAppbar(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.r, vertical: 30.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset('assets/icon/watchnlogo.svg',
                            height: 27.h, width: 67.w, color: Const.kWhite),
                        SvgPicture.asset('assets/icon/watchntext.svg',
                            height: 22.h, width: 67.w, color: Const.kWhite),
                      ],
                    ),
                  ),
                  const Spacer(),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return const LiveViewer();
                      }),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.r, right: 30.r),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 45.h,
                          width: 310.w,
                          child: TextField(
                            style: TextStyle(color: Const.kWhite),
                            decoration: InputDecoration(
                                filled: true,
                                border: InputBorder.none,
                                hintText: Strings.comment,
                                hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: Const.kWhite,
                                    fontWeight: FontWeight.w400),
                                fillColor: Colors.transparent,
                                suffixIcon: Assets.icon.dotthree
                                    .svg(color: Const.kWhite, fit: BoxFit.none),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1.0, color: Color(0xffE7E8ED)),
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1.0, color: Color(0xffE7E8ED)),
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.0, color: Color(0xffE7E8ED)),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(32),
                                    ))),
                          ),
                        ),
                        const Spacer(),
                        Assets.icon.like
                            .svg(height: 22.h, width: 27.w, color: Const.kWhite)
                      ],
                    ),
                  ),
                  SizedBox(height: 19.h)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
