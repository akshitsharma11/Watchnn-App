import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:watchn/core/constant/const.dart';

class RoundedWithShadow extends StatefulWidget {
  String? Function(String?)? validator;
  RoundedWithShadow({Key? key, this.validator}) : super(key: key);
  @override
  _RoundedWithShadowState createState() => _RoundedWithShadowState();

  @override
  String toStringShort() => 'Rounded With Shadow';
}

class _RoundedWithShadowState extends State<RoundedWithShadow> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 60.h,
      textStyle: Const.medium.copyWith(color: Const.kBlack, fontSize: 30.sp),
      decoration: BoxDecoration(
        border: Border.all(color: Const.kPerple),
        color: Const.kWhite,
        borderRadius: BorderRadius.circular(5),
      ),
    );

    final cursor = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 21,
        height: 1,
        margin: EdgeInsets.only(bottom: 12.r),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(137, 146, 160, 1),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.only(right: 30.w, left: 30.w),
      child: Pinput(
        validator: widget.validator,
        length: 4,
        controller: controller,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        separator: SizedBox(width: 16.w),
        focusedPinTheme: defaultPinTheme.copyWith(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: Const.kWhite,
            border: Border.all(color: Const.kPerple, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        showCursor: true,
        cursor: cursor,
      ),
    );
  }
}
