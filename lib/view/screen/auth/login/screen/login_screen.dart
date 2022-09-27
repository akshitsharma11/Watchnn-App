import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/core/router/app_router.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/gen/fonts.gen.dart';
import 'package:watchn/utils/widget/const_textfield.dart';
import 'package:watchn/utils/widget/custom_button.dart';
import 'package:watchn/utils/widget/custom_text.dart';
import 'package:watchn/utils/widget/dash_divider.dart';
import 'package:watchn/view/screen/auth/login/screen/confor.dart';
import 'package:watchn/view/screen/auth/signUp/screen/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false, isChecked = false, _autoValidate = false;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Const.kBackground,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          autovalidateMode: _autoValidate
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 30.h),
            AppBar(
              leadingWidth: 70,
              leading: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                    onTap: () {
                      SystemNavigator.pop();
                    },
                    child: Assets.icon.backarrow.svg(
                      fit: BoxFit.cover,
                    )),
              ),
              title: CustomText(
                text: Strings.signin,
                fontSize: 27.sp,
                fontWeight: FontWeight.w800,
                color: Const.kBlue,
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Const.kBackground,
              shadowColor: Colors.transparent,
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 30.r),
              child: CustomText(
                text: Strings.signintoacc,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: Const.kBlue,
              ),
            ),
            SizedBox(height: 60.h),
            Padding(
              padding: EdgeInsets.only(left: 30.r, right: 30.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegisterTextField(
                    hint: Strings.emailHint,
                    keyboardType: TextInputType.emailAddress,
                    fontSize: 17.sp,
                    hintColor: Const.kBlue,
                    controller: email,
                    conttentPad: const EdgeInsets.only(
                      top: 5,
                    ),
                    prefIcon: Assets.icon.usericon
                        .svg(fit: BoxFit.fill, color: Const.kBlue),
                  ),
                  SizedBox(height: 10.h),
                  RegisterTextField(
                    hint: Strings.passwordHint,
                    hintColor: Const.kBlue,
                    controller: password,
                    conttentPad: const EdgeInsets.only(
                      top: 5,
                    ),
                    fontSize: 17.sp,
                    isobs: _passwordVisible ? false : true,
                    prefIcon: Assets.icon.lock
                        .svg(fit: BoxFit.fill, height: 25, width: 19),
                    sufIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        child: Icon(
                            _passwordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off,
                            color: Const.kBlue)),
                  ),
                  SizedBox(height: 47.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Confir()));
                    },
                    child: Center(
                      child: ConstRegisterButton(
                        text: Strings.login,
                        radius: 32,
                        mainColor: Const.kBlue,
                        shadowColor: Const.kBoxshadow,
                      ),
                    ),
                  ),
                  SizedBox(height: 68.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRouter.forgotpass,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: 2
                                .r, // This can be the space you need between text and underline
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Const.kPerple,
                            width:
                                1.0, // This would be the width of the underline
                          ))),
                          child: Text(
                            Strings.forgotpass,
                            style: TextStyle(
                              color: Const.kPerple,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.helveticaNowDisplay,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: Strings.doyouhaveacc,
                        fontSize: 16.sp,
                        fontFamily: FontFamily.helveticaNowDisplay,
                        fontWeight: FontWeight.w400,
                        color: Const.kPerple,
                      ),
                      SizedBox(width: 5.w),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              bottom: 2
                                  .r, // This can be the space you need between text and underline
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Const.kBlue,
                              width:
                                  1.0, // This would be the width of the underline
                            ))),
                            child: Text(
                              Strings.registration,
                              style: TextStyle(
                                color: Const.kBlue,
                                fontFamily: FontFamily.helveticaNowDisplay,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 34.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120.r,
                  child: DashDivider(
                    dashWidth: 1,
                  ),
                ),
                const Spacer(),
                CustomText(
                  text: Strings.othersignin,
                  fontSize: 16.sp,
                  color: Const.kPerple,
                  fontWeight: FontWeight.w400,
                ),
                const Spacer(),
                SizedBox(
                  width: 120.r,
                  child: DashDivider(
                    dashWidth: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 34.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Assets.images.facebookicon
                        .svg(fit: BoxFit.fill, height: 60.h, width: 60.w),
                    SizedBox(height: 15.h),
                    CustomText(
                      text: 'Facebook login',
                      color: Const.kfacebook,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
                Column(
                  children: [
                    Assets.images.googleicon
                        .svg(fit: BoxFit.fill, height: 60.h, width: 60.w),
                    SizedBox(height: 15.h),
                    CustomText(
                      text: 'Google login',
                      color: Const.kred,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20.h)
          ]),
        ),
      ),
    ));
  }
}
