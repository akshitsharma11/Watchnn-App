import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/utils/widget/const_appbar.dart';
import 'package:watchn/utils/widget/const_textfield.dart';
import 'package:watchn/utils/widget/custom_button.dart';
import 'package:watchn/view/screen/auth/login/screen/login_screen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _passwordVisible = false,
      _passwordinVisible = false,
      _autoValidate = false;
  bool isResetPassword = false;

  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Const.kBackground,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidate
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Constappbar(context).appBar(title: Strings.resetPassword),
              SizedBox(height: 43.h),
              Assets.images.verifycode.svg(fit: BoxFit.fill),
              SizedBox(height: 100.h),
              Padding(
                padding: EdgeInsets.only(left: 29.w, right: 29.w),
                child: Column(
                  children: [
                    RegisterTextField(
                      hint: Strings.passwordHint,
                      fontSize: 17.sp,
                      hintColor: Const.kBlue,
                      conttentPad: const EdgeInsets.only(
                        top: 5,
                      ),
                      controller: password,
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
                    SizedBox(height: 10.h),
                    RegisterTextField(
                      hint: Strings.confirmpasswordHint,
                      fontSize: 17.sp,
                      hintColor: Const.kBlue,
                      conttentPad: const EdgeInsets.only(
                        top: 5,
                      ),
                      controller: confirmPass,
                      isobs: _passwordinVisible ? false : true,
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
                  ],
                ),
              ),
              SizedBox(height: 39.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: ConstRegisterButton(
                  text: Strings.continuee,
                  radius: 32,
                  mainColor: Const.kBlue,
                  shadowColor: Const.kBoxshadow,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
