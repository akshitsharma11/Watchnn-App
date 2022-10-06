import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/snackbar.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/core/router/app_router.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/gen/fonts.gen.dart';
import 'package:watchn/utils/widget/const_appbar.dart';
import 'package:watchn/utils/widget/custom_button.dart';
import 'package:watchn/utils/widget/custom_text.dart';
import 'package:watchn/utils/widget/otp_textfield.dart';
import 'package:watchn/view/screen/auth/login/login_bloc/login_bloc.dart';

class Confir extends StatefulWidget {
  Confir(
      {Key? key,
      this.password,
      this.phone,
      this.email,
      this.otp,
      this.confirmpassword})
      : super(key: key);
  final String? email;
  final String? password;
  final String? confirmpassword;
  final String? phone;
  int? otp;
  @override
  State<Confir> createState() => _ConfirState();
}

class _ConfirState extends State<Confir> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool _autoValidate = false;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Const.kBackground,
      body: BlocProvider<UserAuthBloc>(
        create: (context) => UserAuthBloc(),
        child: BlocConsumer<UserAuthBloc, UserAuthState>(
          listener: (context, state) {
            if (state is UserLoaded) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRouter.allowcontact, (route) => false);
            } else if (state is EmailRegisterLoadded) {
              widget.otp = state.otp;
              KSnackbar.successSnackbar(
                title: "Success",
                subtitle: "Otp sent successfully",
              );
            } else if (state is UserError) {
              Const().showError(state.errorMsg!, context);
            }
          },
          builder: (context, state) {
            if (state is UserLoading) {
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
                      onTap: () {
                        final FormState? form = _formKey.currentState;
                        if (form!.validate()) {
                          if (widget.otp.toString() ==
                                  controller.text.toString() &&
                              widget.otp.toString().length == 6) {
                            BlocProvider.of<UserAuthBloc>(context).add(
                                FetchRegister(
                                    phone: widget.phone,
                                    password: widget.password,
                                    email: widget.email,
                                    passwordConfirmation:
                                        widget.confirmpassword));
                          } else if (widget.otp.toString() !=
                              controller.text.toString()) {
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
                            BlocProvider.of<UserAuthBloc>(context)
                                .add(FetchEmailRegister(
                              email: widget.email!,
                            ));
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
                                fontFamily: FontFamily.helveticaNowDisplay,
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
