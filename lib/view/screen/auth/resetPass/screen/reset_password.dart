import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/snackbar.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/utils/widget/const_appbar.dart';
import 'package:watchn/utils/widget/const_textfield.dart';
import 'package:watchn/utils/widget/custom_button.dart';
import 'package:watchn/view/screen/auth/login/screen/login_screen.dart';
import 'package:watchn/view/screen/auth/resetPass/resetPass_bloc/resetpass_bloc.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key, this.email}) : super(key: key);
  final String? email;

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
      body: BlocProvider<ResetpassBloc>(
        create: (context) => ResetpassBloc(),
        child: BlocConsumer<ResetpassBloc, ResetpassState>(
          listener: (context, state) {
            if (state is ResetpassLoaded) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
              KSnackbar.successSnackbar(
                title: "Success",
                subtitle: "Password updated successfully",
              );
            } else if (state is ResetpassError) {
              KSnackbar.errorSnackbar(
                title: "Error",
                subtitle: state.errorMsg!,
              );
            }
          },
          builder: (context, state) {
            if (state is ResetpassLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
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
                            validatorFunction: MultiValidator([
                              RequiredValidator(
                                  errorText: "password is required"),
                              MinLengthValidator(
                                  errorText:
                                      "password must be at least 6 characters",
                                  6),
                            ]),
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
                            validatorFunction: MultiValidator([
                              RequiredValidator(
                                  errorText: "Confirm password is required"),
                              MinLengthValidator(
                                  errorText:
                                      "password must be at least 6 characters",
                                  6),
                            ]),
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
                        final FormState? form = _formKey.currentState;
                        if (form!.validate()) {
                          if (password.text == confirmPass.text) {
                            BlocProvider.of<ResetpassBloc>(context).add(
                                FetchResetPassword(
                                    email: widget.email,
                                    newPass: confirmPass.text));
                          } else if (password.text != confirmPass.text) {
                            KSnackbar.errorSnackbar(
                              title: "Error",
                              subtitle: "Password does not match",
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
