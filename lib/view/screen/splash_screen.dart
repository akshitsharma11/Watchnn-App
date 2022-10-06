import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/data/data_providers/data_provider.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/model/auth_model/login_model.dart';
import 'package:watchn/view/screen/home/screen/allow_contact/screen/allow_contact.dart';

import 'auth/login/screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) async {
      LoginModel? dataModel = await MyHydratedStorage().getUser();

      print(dataModel?.toJson().toString());
      if (dataModel != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => dataModel.xAccessToken!.isNotEmpty
                    ? const AllowContact()
                    : const LoginScreen()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Const.kWhite,
        body: Column(
          children: [
            Expanded(
                flex: 19,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [const Color(0xff383A7D), Const.kBlue1],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.images.applogoWhite
                              .svg(height: 136.h, width: 186.w),
                          SizedBox(height: 34.h),
                          Text(
                            Strings.welcome,
                            style: Const.large.copyWith(
                                fontSize: 64.sp, fontWeight: FontWeight.w100),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          SizedBox(
                            width: 354.w,
                            child: Text(
                              Strings.tagline,
                              textAlign: TextAlign.center,
                              style: Const.large.copyWith(fontSize: 24.sp),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.images.logoBlue.svg(width: 111.w, height: 45.h),
                    SizedBox(
                      width: 9.w,
                    ),
                    Text(
                      'WATCHN',
                      style: Const.large.copyWith(
                          color: Const.kBlue1,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: 23.w,
                    ),
                    SizedBox(
                      width: 72.w,
                      child: Text(
                        Strings.powerByCommunity,
                        textAlign: TextAlign.center,
                        style: Const.medium
                            .copyWith(color: Const.kred, fontSize: 14.sp),
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
