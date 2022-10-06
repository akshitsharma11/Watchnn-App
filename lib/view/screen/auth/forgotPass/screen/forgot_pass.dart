import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/snackbar.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/utils/widget/const_appbar.dart';
import 'package:watchn/utils/widget/const_textfield.dart';
import 'package:watchn/utils/widget/custom_button.dart';
import 'package:watchn/utils/widget/custom_text.dart';
import 'package:watchn/view/screen/auth/forgotOTP/scren/confirmation.dart';
import 'package:watchn/view/screen/auth/forgotPass/forgot_bloc/forgot_pass_bloc.dart';

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
            body: BlocProvider<ForgotPassBloc>(
              create: (context) => ForgotPassBloc(),
              child: BlocConsumer<ForgotPassBloc, ForgotAuthState>(
                listener: (context, state) {
                  if (state is ForgotLoaded) {
                    KSnackbar.successSnackbar(
                      title: "Success",
                      subtitle: "Otp sent successfully",
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Confirmation(
                                  email: email.text,
                                  otp: state.otp,
                                )));
                  } else if (state is ForgotError) {
                    KSnackbar.errorSnackbar(
                      title: "Error",
                      subtitle: state.errorMsg!,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ForgotLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      autovalidateMode: _autoValidate
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 30.h),
                          Constappbar(context)
                              .appBar(title: Strings.forgotpassword),
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
                              hint: 'Enter Email',
                              controller: email,
                              conttentPad: const EdgeInsets.only(
                                top: 5,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validatorFunction: (value) {
                                String pattern =
                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                    r"{0,253}[a-zA-Z0-9])?)*$";
                                RegExp regex = RegExp(pattern);
                                if (value!.isEmpty) {
                                  return "Email cannot be empty";
                                } else if (!regex.hasMatch(value)) {
                                  return "Enter a valid email";
                                }
                                return null;
                              },
                              fontSize: 17.sp,
                              hintColor: Const.kBlue,
                              prefIcon: Assets.icon.usericon
                                  .svg(fit: BoxFit.fill, color: Const.kBlue),
                            ),
                          ),
                          SizedBox(height: 39.h),
                          GestureDetector(
                            onTap: () {
                              final FormState? form = _formKey.currentState;
                              if (form!.validate()) {
                                BlocProvider.of<ForgotPassBloc>(context)
                                    .add(FetchEmailForgot(email: email.text));
                              }
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
                  );
                },
              ),
            )));
  }
}
