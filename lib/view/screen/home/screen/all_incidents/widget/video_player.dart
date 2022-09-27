import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/utils/widget/custom_text.dart';
import 'package:watchn/view/screen/home/screen/all_incidents/screen/past_incidents.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({Key? key}) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
      // 'http://techslides.com/demos/sample-videos/small.mp4',
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _controller!.addListener(() {
      setState(() {});
    });
    _controller!.setLooping(false);
    _controller!.initialize();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 17.r),
        child: Container(
            height: 137.h,
            width: 116.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
            child: Stack(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  height: 137.h,
                  width: 116.w,
                  child: AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: Stack(
                      children: <Widget>[
                        VideoPlayer(_controller!),
                        ClosedCaption(
                          text: _controller!.value.caption.text,
                        ),
                        _ControlsOverlay(
                          controller: _controller!,
                        ),
                        VideoProgressIndicator(_controller!,
                            allowScrubbing: true,
                            colors: const VideoProgressColors(
                                backgroundColor: Colors.transparent,
                                bufferedColor: Colors.transparent,
                                playedColor: Colors.transparent)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Assets.images.yash.image(width: 20, height: 20),
                                SizedBox(width: 4.w),
                                CustomText(
                                  text: 'Hijbullah',
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Const.kWhite,
                                ),
                              ],
                            ),
                            Assets.icon.close.svg(
                                height: 10.h, width: 10.w, color: Const.kWhite),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 10.r),
                        child: CustomText(
                          text: '29 July 2021',
                          color: Const.kWhite,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 15.h)
                    ],
                  ),
                ),
              ],
            )));
  }
}

class _ControlsOverlay extends StatefulWidget {
  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);
  final VideoPlayerController controller;

  @override
  State<_ControlsOverlay> createState() => _ControlsOverlayState();
}

class _ControlsOverlayState extends State<_ControlsOverlay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Center(
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 50.0,
            semanticLabel: 'Play',
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return PastIncidents(
                  controller: widget.controller,
                );

                //   VideoPlayScreen(
                //   controller: widget.controller,
                // );
              },
            ));

            // widget.controller.value.isPlaying
            //     ? widget.controller.pause()
            //     : widget.controller.play();
          },
        ),
      ],
    );
  }
}
