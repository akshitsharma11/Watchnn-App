import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/utils/widget/const_textfield.dart';
import 'package:watchn/utils/widget/custom_button.dart';
import 'package:watchn/utils/widget/custom_text.dart';
import 'package:watchn/view/screen/auth/forgotOTP/scren/confirmation.dart';

import '../../../../../utils/widget/const_appbar.dart';

class ForgotPass extends StatelessWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _autoValidate = false;
    final TextEditingController email = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.h),
                    Constappbar(context).appBar(title: Strings.forgotpassword),
                    SizedBox(height: 38.h),
                    Assets.images.verifycode.svg(fit: BoxFit.fill),
                    SizedBox(height: 38.h),
                    CustomText(
                      text: Strings.sendCode,
                      fontSize: 17.sp,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w400,
                      color: Const.kBlue,
                    ),
                    SizedBox(height: 80.h),
                    Padding(
                      padding: EdgeInsets.only(left: 29.w, right: 29.w),
                      child: RegisterTextField(
                        hint: Strings.emailHint,
                        controller: email,
                        conttentPad: const EdgeInsets.only(
                          top: 5,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        fontSize: 17.sp,
                        hintColor: Const.kBlue,
                        prefIcon: Assets.icon.usericon
                            .svg(fit: BoxFit.fill, color: Const.kBlue),
                      ),
                    ),
                    SizedBox(height: 39.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Confirmation()));
                      },
                      child: Center(
                        child: ConstRegisterButton(
                          text: Strings.continuee,
                          radius: 32,
                          mainColor: Const.kBlue,
                          shadowColor: Const.kBoxshadow,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
