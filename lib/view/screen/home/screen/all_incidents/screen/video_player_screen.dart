import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/utils/widget/custom_text.dart';

class VideoPlayScreen extends StatefulWidget {
  VideoPlayScreen({Key? key, this.controller}) : super(key: key);

  VideoPlayerController? controller;

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  Duration? position;
  bool isPLaying = true;
  bool isUnmute = true;
  @override
  void initState() {
    widget.controller?.addListener(() {
      if (widget.controller!.value.isInitialized) {
        Duration duration = widget.controller!.value.duration;
        position = widget.controller!.value.position;
        isPLaying = widget.controller!.value.isPlaying;
      }
    });
    super.initState();
  }

  // @override
  // void dispose() {
  //   widget.controller!.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: AspectRatio(
              aspectRatio: widget.controller!.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(widget.controller!),
                  ClosedCaption(text: widget.controller!.value.caption.text),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: VideoProgressIndicator(widget.controller!,
                        allowScrubbing: true,
                        colors: const VideoProgressColors(
                            backgroundColor: Colors.transparent,
                            bufferedColor: Colors.transparent,
                            playedColor: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(left: 25.r, right: 25.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35.h),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:
                              Assets.icon.backarrow.svg(color: Const.kWhite)),
                      const Spacer(),
                      CustomText(
                        text: 'Share',
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Assets.icon.share1.svg(height: 21, width: 20),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            widget.controller?.seekTo(
                                (position)! - const Duration(seconds: 10));
                          },
                          child: SvgPicture.asset('assets/icon/left10.svg')),
                      SizedBox(width: 50.w),
                      Container(
                          height: 65.h,
                          width: 65.w,
                          decoration: BoxDecoration(
                              color: Const.kWhite, shape: BoxShape.circle),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isPLaying) {
                                    widget.controller!.pause();
                                  } else {
                                    widget.controller!.play();
                                  }
                                });
                              },
                              child: Center(
                                  child: isPLaying
                                      ? const Icon(
                                          Icons.pause,
                                          size: 35,
                                        )
                                      : const Icon(
                                          Icons.play_arrow,
                                          size: 35,
                                        )))),
                      SizedBox(width: 50.w),
                      GestureDetector(
                          onTap: () async {
                            widget.controller?.seekTo(
                                (position)! + const Duration(seconds: 10));
                          },
                          child: SvgPicture.asset('assets/icon/right10.svg')),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      SizedBox(width: 10.w),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isUnmute) {
                                widget.controller!.setVolume(0.0);
                              } else {
                                widget.controller!.setVolume(50.0);
                              }
                              isUnmute = !isUnmute;
                            });
                          },
                          child: isUnmute
                              ? SvgPicture.asset('assets/icon/volume.svg',
                                  height: 22.h, width: 22.w)
                              : SvgPicture.asset(
                                  'assets/icon/mute.svg',
                                  height: 22.h,
                                  width: 22.w,
                                ))
                    ],
                  ),
                  SizedBox(height: 30.h)
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
