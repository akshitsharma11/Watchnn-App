import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/utils/widget/custom_text.dart';
import 'package:watchn/view/screen/home/screen/allow_contact/screen/live_video_screen.dart';

class HomeDailogBox extends StatefulWidget {
  const HomeDailogBox({Key? key}) : super(key: key);

  @override
  State<HomeDailogBox> createState() => _HomeDailogBoxState();
}

class _HomeDailogBoxState extends State<HomeDailogBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          AlertDialog(
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
                  SizedBox(height: 30.h),
                  CustomText(
                    text:
                        'Search from your contact\n list and go live with them',
                    color: Const.kBlue,
                    textAlign: TextAlign.center,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.only(left: 27.r, right: 27.r),
                    child: SizedBox(
                      height: 50.h,
                      width: 298.w,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            hintText: Strings.searchincontact,
                            hintStyle: TextStyle(
                                fontSize: 18.sp,
                                color: Const.kPerple1,
                                fontWeight: FontWeight.w400),
                            fillColor: Const.kWhite,
                            prefixIcon: Assets.icon.search.svg(
                                fit: BoxFit.none, height: 8.h, width: 10.w),
                            suffixIcon: Assets.icon.mic.svg(
                                fit: BoxFit.none, height: 15.h, width: 21.w),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xffA7B5E2)),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xffA7B5E2)),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xffA7B5E2)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32),
                                ))),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Padding(
                      padding: EdgeInsets.only(right: 15.r),
                      child: RawScrollbar(
                        thumbColor: Const.kBlue,
                        thickness: 9,
                        radius: const Radius.circular(10),
                        interactive: true,
                        thumbVisibility: true,
                        trackVisibility: false,
                        child: ListView.builder(
                            itemCount: 8,
                            physics: const PageScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(width: 25.w),
                                  Transform.scale(
                                    scale: 1.1,
                                    child: Checkbox(
                                      activeColor: const Color(0xff2C3FE9),
                                      checkColor: Const.kWhite,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                        Radius.circular(9),
                                      )),
                                      side: BorderSide(
                                        color: Const.kPerple1,
                                        width: 1.2,
                                      ),
                                      value: isChecked,
                                      onChanged: (value) {
                                        isChecked = !isChecked;
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  Assets.images.yash
                                      .image(width: 30.w, height: 30.h),
                                  SizedBox(width: 12.w),
                                  CustomText(
                                    text: 'Mom',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Const.kBlack,
                                  )
                                ],
                              );
                            }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 35.r, right: 35.r, top: 30.r, bottom: 15.r),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LiveVideo()));
                      },
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xffFF4D4D), Color(0xffB70000)],
                            ),
                            borderRadius: BorderRadius.circular(32)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icon/golive.svg',
                                  height: 21.h, width: 21.w),
                              SizedBox(width: 5.w),
                              CustomText(
                                text: 'Go Live',
                                color: Const.kWhite,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h)
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 22,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  height: 53.h,
                  width: 53.w,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(55, 57, 124, 0.25),
                            offset: Offset(-2, -3),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                      color: Const.kWhite,
                      borderRadius: BorderRadius.circular(32)),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icon/close.svg',
                      color: Colors.black,
                      height: 20.h,
                      width: 20.w,
                    ),
                  )),
            ),
            // SvgPicture.asset('assets/svgs/edit.svg')
          ),
        ],
      ),
    );
  }
}
