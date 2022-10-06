import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/utils/widget/custom_text.dart';

class ContactListWidget extends StatefulWidget {
  const ContactListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ContactListWidget> createState() => _ContactListWidgetState();
}

class _ContactListWidgetState extends State<ContactListWidget> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: Const.kLightBule),
        child: Column(
          children: [
            Row(children: [
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.only(left: 15.r, right: 15.r),
                child: Image.asset('assets/images/johndoe.png'),
              ),
              CustomText(
                text: Strings.johndoe,
                fontSize: 18.sp,
                color: Const.kBlack,
                fontWeight: FontWeight.w700,
              ),
              const Spacer(),
              isAdded
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isAdded = !isAdded;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.check,
                            color: Const.kGreen,
                            size: 21.h.w,
                          ),
                          Text(Strings.added,
                              style: Const.medium.copyWith(
                                  color: Const.kGreen, fontSize: 16.sp))
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 45.h,
                      width: 45.w,
                      child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              isAdded = !isAdded;
                            });
                          },
                          heroTag: null,
                          backgroundColor: Const.kWhite,
                          child: Assets.icon.add.svg()),
                    ),
              SizedBox(width: 17.w)
            ]),
            Divider(
              color: Const.kLightDiv,
              thickness: 1.0,
            )
          ],
        ),
      ),
    );
  }
}
