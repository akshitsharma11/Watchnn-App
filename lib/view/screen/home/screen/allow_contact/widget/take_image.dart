import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/core/constant/string.dart';
import 'package:watchn/utils/widget/custom_text.dart';

class TakePicture extends StatefulWidget {
  const TakePicture({Key? key}) : super(key: key);

  @override
  State<TakePicture> createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  @override
  Widget build(BuildContext context) {
    ImagePicker _imagePicker = ImagePicker();
    File? imgPath;
    Future getImageResult(ImageSource sourceType) async {
      try {
        // final PermissionHandler _permissionHandler = PermissionHandler();
        PermissionStatus result = await Permission.storage.request();
        // await _permissionHandler
        //     .requestPermissions([PermissionGroup.storage]);
        if (result == PermissionStatus.granted) {
          Navigator.pop(context);
          var image = await _imagePicker.pickImage(
            source: sourceType,
            imageQuality: 5,
            maxHeight: 480,
            maxWidth: 640,
          );
          imgPath = File(image!.path);

          setState(() {});
        }
      } catch (err) {}
    }

    return Padding(
      padding: EdgeInsets.only(left: 15.r, right: 15.r),
      child: Center(
        child: DottedBorder(
          dashPattern: const [6, 6],
          strokeWidth: 1.0,
          strokeCap: StrokeCap.round,
          color: const Color(0xffA3AFBF),
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Material(
                      color: Colors.white,
                      child: SizedBox(
                          height: 100.h,
                          width: 1.sw,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    getImageResult(ImageSource.gallery);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image,
                                        size: 35.h.w,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        'Gallery',
                                        style: Const.medium.copyWith(
                                            color: Colors.black,
                                            fontSize: 18.sp),
                                      )
                                    ],
                                  )),
                              SizedBox(
                                width: 15.w,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    getImageResult(ImageSource.camera);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.camera,
                                        size: 35.h.w,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        'Camera',
                                        style: Const.medium.copyWith(
                                            color: Colors.black,
                                            fontSize: 18.sp),
                                      )
                                    ],
                                  )),
                            ],
                          )),
                    );
                  });
            },
            child: imgPath != null
                ? Image.file(
                    imgPath!,
                    height: 140.h,
                    width: 374.w,
                  )
                : Container(
                    height: 261.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      // borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Container(
                          height: 50,
                          width: 230,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                Color(0xff5FC37B),
                                Color(0xff0F9D58),
                              ]),
                              borderRadius: BorderRadius.circular(32),
                              boxShadow: [
                                BoxShadow(
                                    color: Const.kcameraShadow,
                                    spreadRadius: -10,
                                    offset: const Offset(0, 25),
                                    blurRadius: 25)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icon/camera.svg',
                                  height: 25.h, width: 32.w),
                              SizedBox(width: 10.w),
                              CustomText(
                                text: Strings.takepicture,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: Const.kWhite,
                              ),
                            ],
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
