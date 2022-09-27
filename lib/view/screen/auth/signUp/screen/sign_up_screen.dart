import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/core/router/app_router.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/gen/fonts.gen.dart';
import 'package:watchn/utils/widget/const_appbar.dart';
import 'package:watchn/utils/widget/const_textfield.dart';
import 'package:watchn/utils/widget/custom_button.dart';
import 'package:watchn/utils/widget/custom_text.dart';
import 'package:watchn/utils/widget/dash_divider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _passwordVisible = false,
      isChecked = false,
      _passwordinVisible = false,
      _autoValidate = false;

  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Const.kBackground,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        autovalidateMode: _autoValidate
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 30.h),
          Constappbar(context).appBar(title: Strings.signup),
          SizedBox(height: 30.h),
          Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 30.r, right: 30.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegisterTextField(
                        hint: "Enter phone number",
                        controller: phoneNumber,
                        conttentPad: const EdgeInsets.only(
                          top: 5,
                        ),
                        fontSize: 17.sp,
                        hintColor: Const.kBlue,
                        keyboardType: TextInputType.phone,
                        prefIcon: Assets.icon.phone
                            .svg(fit: BoxFit.fill, height: 23.h, width: 21.w),
                      ),
                      SizedBox(height: 10.h),
                      RegisterTextField(
                        hint: " Enter email",
                        controller: email,
                        conttentPad: const EdgeInsets.only(
                          top: 5,
                        ),
                        fontSize: 17.sp,
                        hintColor: Const.kBlue,
                        keyboardType: TextInputType.emailAddress,
                        prefIcon: Assets.icon.email
                            .svg(fit: BoxFit.fill, height: 23.h, width: 21.w),
                      ),
                      SizedBox(height: 10.h),
                      RegisterTextField(
                        hint: " Enter password",
                        fontSize: 17.sp,
                        conttentPad: const EdgeInsets.only(
                          top: 5,
                        ),
                        hintColor: Const.kBlue,
                        controller: password,
                        isobs: _passwordVisible ? false : true,
                        prefIcon: Assets.icon.lock
                            .svg(fit: BoxFit.fill, height: 25, width: 21),
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
                      SizedBox(height: 10.h),
                      RegisterTextField(
                        hint: " Confirm password",
                        fontSize: 17.sp,
                        hintColor: Const.kBlue,
                        isobs: _passwordinVisible ? false : true,
                        conttentPad: const EdgeInsets.only(
                          top: 7,
                        ),
                        controller: confirmPass,
                        prefIcon: Assets.icon.lock
                            .svg(fit: BoxFit.fill, height: 25, width: 19),
                        sufIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _passwordinVisible = !_passwordinVisible;
                              });
                            },
                            child: Icon(
                                _passwordinVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off,
                                color: Const.kBlue)),
                      ),
                      SizedBox(height: 47.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              AppRouter.allowcontact, (route) => false);
                        },
                        child: Center(
                          child: ConstRegisterButton(
                            text: Strings.register,
                            radius: 32,
                            mainColor: Const.kBlue,
                            shadowColor: Const.kBoxshadow,
                          ),
                        ),
                      ),
                      SizedBox(height: 68.h),
                      Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                activeColor: Const.kBlueCheck,
                                checkColor: Const.kWhite,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                value: isChecked,
                                onChanged: (value) {
                                  isChecked = !isChecked;
                                  setState(() {});
                                },
                              ),
                              CustomText(
                                text: Strings.termscondi,
                                fontSize: 16.sp,
                                color: Const.kPerple,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 50.w,
                              ),
                              CustomText(
                                text: Strings.alreadyacc,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Const.kPerple,
                              ),
                              SizedBox(width: 5.w),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        AppRouter.login, (route) => false);
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
                                      Strings.login,
                                      style: TextStyle(
                                        color: Const.kBlue,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w800,
                                        fontFamily:
                                            FontFamily.helveticaNowDisplay,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 34.h),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: DashDivider(
                                dashWidth: 1,
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          CustomText(
                            text: Strings.otherregistration,
                            fontSize: 16.sp,
                            color: Const.kPerple,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: DashDivider(
                                dashWidth: 1,
                              ),
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
                              Assets.images.facebookicon.svg(
                                  fit: BoxFit.fill, width: 60.w, height: 60.h),
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
                              Assets.images.googleicon.svg(
                                  fit: BoxFit.fill, height: 60.h, width: 60.w),
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
