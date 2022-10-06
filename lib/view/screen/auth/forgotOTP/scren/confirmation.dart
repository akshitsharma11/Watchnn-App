import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/snackbar.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/utils/widget/const_appbar.dart';
import 'package:watchn/utils/widget/custom_button.dart';
import 'package:watchn/utils/widget/custom_text.dart';
import 'package:watchn/utils/widget/otp_textfield.dart';
import 'package:watchn/view/screen/auth/forgotPass/forgot_bloc/forgot_pass_bloc.dart';
import 'package:watchn/view/screen/auth/resetPass/screen/reset_password.dart';

class Confirmation extends StatefulWidget {
  Confirmation({
    Key? key,
    this.email,
    this.otp,
  }) : super(key: key);
  final String? email;
  int? otp;

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Const.kBackground,
      body: BlocProvider<ForgotPassBloc>(
        create: (context) => ForgotPassBloc(),
        child: BlocConsumer<ForgotPassBloc, ForgotAuthState>(
          listener: (context, state123) {
            if (state123 is ForgotLoaded) {
              widget.otp = state123.otp;
              KSnackbar.successSnackbar(
                title: "Success",
                subtitle: "Otp sent successfully",
              );
            }
          },
          builder: (context, state) {
            if (state is ForgotLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Form(
              key: _formKey,
              autovalidateMode: _autoValidate
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    Constappbar(context).appBar(title: Strings.confirmation),
                    SizedBox(height: 45.h),
                    Assets.images.verifycode.svg(fit: BoxFit.fill),
                    SizedBox(height: 40.h),
                    CustomText(
                      text: Strings.confircode,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Const.kBlue,
                    ),
                    SizedBox(height: 5.h),
                    CustomText(
                      text: Strings.inboxCheck,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Const.kBlue,
                    ),
                    SizedBox(height: 69.h),
                    RoundedWithShadow(
                      controller: controller,
                      validator: (pin) {
                        if (pin!.isEmpty) {
                          return KSnackbar.errorSnackbar(
                            title: "Error",
                            subtitle: "Please enter otp",
                          );
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 25.h),
                    GestureDetector(
                      onTap: () async {
                        final FormState? form = _formKey.currentState;
                        if (form!.validate()) {
                          if (widget.otp.toString() ==
                                  controller.text.toString() &&
                              controller.text.toString().length == 6) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ResetPassword(email: widget.email)));
                          } else {
                            KSnackbar.errorSnackbar(
                              title: "Error",
                              subtitle: "Wrong otp",
                            );
                          }
                        }
                      },
                      child: ConstRegisterButton(
                        text: Strings.continuee,
                        radius: 32,
                        mainColor: Const.kBlue,
                        shadowColor: Const.kBoxshadow,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: Strings.didntGetotp,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Const.kPerple,
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<ForgotPassBloc>(context)
                                .add(FetchEmailForgot(email: widget.email));
                            KSnackbar.successSnackbar(
                              title: "Success",
                              subtitle: "Otp resent successfully",
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              bottom: 2.r,
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Const.kBlue1,
                              width: 1.0,
                            ))),
                            child: Text(
                              Strings.resendOtp,
                              style: TextStyle(
                                color: Const.kBlue,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
