import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/gen/assets.gen.dart';

class Const {
  static Color kBackground = const Color(0xffF2F6F9);
  static Color kBlack = const Color(0xff000000);
  static Color kBlue1 = const Color(0xff141E38);
  static Color kWhite = const Color(0xffffffff);
  static Color kWhite1 = const Color(0xffE7E8ED);
  static Color kBlue = const Color(0xff15175A);
  static Color kBlueCheck = const Color(0xff0067C7);
  static Color kGreen = const Color(0xff119E59);
  static Color kPerple = const Color(0xff8D93C9);
  static Color kPerple1 = const Color(0xff95A6DB);
  static Color kRed = const Color(0xffE20000);
  static Color kshadow = const Color(0xff383A7D);
  static Color kRed1 = const Color(0xffFF0404);
  static Color kLightDiv = const Color(0xffC1CDDF);
  static Color kPurple = const Color(0xff16185B);
  static Color kPerple2 = const Color(0xffE6E6FF);
  static Color kPerple3 = const Color(0xff646996);
  static Color kLightBule = const Color(0xffE5E6FF);
  static Color klightRed = const Color(0xffFFDFDF);
  static Color kTitle = const Color(0xff2C3FE9);
  static Color kblue1 = const Color(0xff407BFF);
  static Color kInnerborder = const Color(0xffA2A8DA);
  static Color kfacebook = const Color(0xff3B5998);
  static Color kred = const Color(0xffEB4132);

  static Color kBoxshadow = const Color.fromRGBO(20, 0, 255, 0.2);
  static Color kBoxshadow1 = const Color.fromRGBO(55, 57, 124, 0.25);
  static Color kredshadow = const Color.fromRGBO(208, 0, 0, 0.25);
  static Color kButton = const Color.fromRGBO(20, 0, 255, 0.15);
  static Color kcameraShadow = const Color.fromRGBO(0, 87, 24, 0.25);

  /// Padding
  static const double kPaddingS = 8.0;
  static const double kPaddingM = 16.0;
  static const double kPaddingL = 25.0;
  static const double kPaddingXL = 32.0;

  /// Spacing
  static double kSpace8 = 8.w.h;
  static double kSpace14H = 14.h;
  static double kSpace20H = 20.h;
  static double kSpace30H = 30.h;
  static double kSpace20W = 20.w;
  static double kSpace30W = 30.w;
  static double kSpaceM = 20.w.h;

  ///fonts
  static double kFont12 = 12.sp;
  static double kFont14 = 14.sp;
  static double kFont16 = 16.sp;
  static double kFont18 = 18.sp;
  static double kFont20 = 20.sp;
  static double kFont22 = 22.sp;
  static double kFont24 = 24.sp;
  static double kFont34 = 34.sp;

  /// Large
  static TextStyle large = TextStyle(
    color: Const.kWhite,
    fontFamily: Assets.fonts.helveticaNowDisplayBold,
    fontWeight: FontWeight.bold,
    fontSize: 30.sp,
  );

  /// Medium
  static TextStyle bold = TextStyle(
      color: Const.kWhite,
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
      fontFamily: Assets.fonts.helveticaNowDisplayMedium);

  /// Small
  static TextStyle medium = TextStyle(
    color: Const.kWhite,
    fontSize: 24.sp,
    fontFamily: Assets.fonts.helveticaNowDisplayRegular,
    fontWeight: FontWeight.w400,
  );

  void showError(String error, context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(error),
      backgroundColor: Theme.of(context).errorColor,
    ));
  }

  void showMessage(String message, context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Theme.of(context).indicatorColor,
    ));
  }
}

class RichWidget extends StatelessWidget {
  RichWidget({this.text, this.style, this.span});
  TextStyle? style;
  String? text;
  List<TextSpan>? span;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(text: text, style: style, children: span),
    );
  }
}
