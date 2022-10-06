import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/gen/fonts.gen.dart';
import 'package:watchn/utils/widget/custom_text.dart';
import 'package:watchn/view/screen/home/screen/allow_contact/screen/allow_contact.dart';
import 'package:watchn/view/screen/home/screen/allow_contact/widget/home_dailogBox.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Const.kBackground,
      body: Column(children: [
        SizedBox(height: 30.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AllowContact()));
              },
              child: Container(
                  width: 125.w,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icon/invitefriends.svg',
                          width: 17.w, height: 17.h),
                      SizedBox(width: 6.w),
                      CustomText(
                        text: Strings.invitefriends,
                        color: Const.kWhite,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      )
                    ],
                  )),
            ),
          ],
        ),
        SizedBox(height: 35.h),
        Expanded(
          child: Container(
            height: 349.h,
            width: MediaQuery.of(context).size.width,
            color: Const.klightRed,
            child: Column(
              children: [
                const Spacer(),
                Assets.images.record.svg(),
                SizedBox(height: 20.h),
                Text(
                  Strings.record,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Const.kred,
                    fontSize: 16.sp,
                    fontFamily: FontFamily.spaceGrotesk,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 26.h),
                GestureDetector(
                  onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => const HomeDailogBox()),
                  child: Container(
                    width: 250.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xffFF0404), Color(0xffDD0000)],
                        ),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(208, 0, 0, 0.25),
                              spreadRadius: -10,
                              offset: Offset(0, 25),
                              blurRadius: 25)
                        ],
                        borderRadius: BorderRadius.circular(32)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/recording.svg'),
                          SizedBox(width: 5.w),
                          CustomText(
                            text: Strings.record1,
                            color: Const.kWhite,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 336.h,
            width: MediaQuery.of(context).size.width,
            color: Const.kLightBule,
            child: Column(
              children: [
                const Spacer(),
                Assets.images.witness.svg(),
                SizedBox(height: 20.h),
                Text(
                  Strings.witness,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Const.kPurple,
                    fontSize: 16.sp,
                    fontFamily: FontFamily.spaceGrotesk,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 26.h),
                ConstButton(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            const HomeDailogBox());
                  },
                  mainColor: Const.kBlue,
                  text: Strings.witness1,
                  shadowColor: Const.kshadow,
                  image: 'assets/images/eye.svg',
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w800,
                      color: Const.kWhite),
                ),
                const Spacer()
              ],
            ),
          ),
        )
      ]),
    ));
  }
}

class ConstButton extends StatelessWidget {
  ConstButton({
    Key? key,
    this.text,
    this.radius,
    this.image,
    this.mainColor,
    this.shadowColor,
    this.style,
    this.onTap,
  }) : super(key: key);
  final String? text;
  final Function()? onTap;
  final Color? mainColor;

  final Color? shadowColor;
  final double? radius;
  final TextStyle? style;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: mainColor!,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                  color: shadowColor!,
                  spreadRadius: -10,
                  offset: const Offset(0, 25),
                  blurRadius: 25)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image!),
            SizedBox(width: 7.w),
            Text(
              text!,
              style: style ??
                  Const.bold.copyWith(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
