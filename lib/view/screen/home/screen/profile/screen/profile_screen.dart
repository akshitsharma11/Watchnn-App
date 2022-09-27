import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/utils/widget/const_textfield.dart';
import 'package:watchn/utils/widget/custom_button.dart';
import 'package:watchn/utils/widget/custom_text.dart';
import 'package:watchn/view/screen/home/screen/dashboard.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController pincode = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final bool _autoValidate = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Const.kBackground,
      appBar: PreferredSize(
        preferredSize: const Size(1, 100),
        child: Padding(
          padding: EdgeInsets.only(top: 25.r),
          child: Row(
            children: [
              SizedBox(width: 35.w),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DashBoard()));
                  },
                  child: Assets.icon.backarrow.svg(width: 30, height: 20)),
              const Spacer(),
              CustomText(
                text: Strings.profile,
                fontSize: 27.sp,
                fontWeight: FontWeight.w800,
                color: Const.kBlue,
              ),
              const Spacer(),
              Container(
                width: 75.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Const.kBlue,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icon.editSvg.svg(height: 15.h, width: 15.w),
                    SizedBox(width: 5.w),
                    Padding(
                      padding: EdgeInsets.only(top: 2.r),
                      child: Text(
                        Strings.edit,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Const.kWhite,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w)
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidate
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: Padding(
            padding: EdgeInsets.only(left: 10.r, right: 10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.r),
                  child:
                      Assets.images.johnPng.image(height: 100.h, width: 100.w),
                ),
                RegisterTextField(
                  hint: Strings.nameHint,
                  controller: name,
                  fontSize: 17.sp,
                  hintColor: Const.kBlue,
                  keyboardType: TextInputType.name,
                ),
                RegisterTextField(
                  hint: Strings.phoneHint,
                  controller: phone,
                  fontSize: 17.sp,
                  hintColor: Const.kBlue,
                  keyboardType: TextInputType.phone,
                ),
                RegisterTextField(
                  hint: Strings.emailaddressHint,
                  controller: email,
                  fontSize: 17.sp,
                  hintColor: Const.kBlue,
                  keyboardType: TextInputType.emailAddress,
                ),
                RegisterTextField(
                  hint: Strings.addressdHint,
                  controller: address,
                  fontSize: 17.sp,
                  hintColor: Const.kBlue,
                  keyboardType: TextInputType.text,
                ),
                RegisterTextField(
                  hint: Strings.countrydHint,
                  controller: country,
                  fontSize: 17.sp,
                  hintColor: Const.kBlue,
                  keyboardType: TextInputType.text,
                ),
                RegisterTextField(
                  hint: Strings.citydHint,
                  controller: city,
                  fontSize: 17.sp,
                  hintColor: Const.kBlue,
                  keyboardType: TextInputType.text,
                ),
                RegisterTextField(
                  hint: Strings.pincodeHint,
                  controller: pincode,
                  fontSize: 17.sp,
                  hintColor: Const.kBlue,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 15.h),
                Center(
                  child: ConstRegisterButton(
                    text: Strings.submit,
                    radius: 32,
                    mainColor: Const.kBlue,
                    shadowColor: Const.kBoxshadow,
                  ),
                ),
                SizedBox(height: 38.h),
                Container(
                  height: 70.h,
                  color: Const.kBlue,
                  child: Row(
                    children: [
                      SizedBox(width: 26.w),
                      Icon(Icons.logout, color: Const.kWhite),
                      SizedBox(width: 10.w),
                      CustomText(
                          text: Strings.logout,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                          color: Const.kWhite),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
