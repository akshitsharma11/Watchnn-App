import 'package:flutter/material.dart';
import 'package:watchn/utils/widget/const_appbar.dart';

class ViewLocation extends StatefulWidget {
  const ViewLocation({Key? key}) : super(key: key);

  @override
  State<ViewLocation> createState() => _ViewLocationState();
}

class _ViewLocationState extends State<ViewLocation> {
  // final Completer<GoogleMapController> _controller = Completer();
  //
  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  //
  // static const CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: Constappbar(context).appBar(
        title: 'Map',
      ),
      // body: Padding(
      //   padding:
      //       EdgeInsets.only(left: 20.w, right: 20.w, top: 30.r, bottom: 10.r),
      //   child: Container(
      //     // height: 629.h,
      //     // width: 374.w,
      //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      //     child: GoogleMap(
      //       mapType: MapType.hybrid,
      //       initialCameraPosition: _kGooglePlex,
      //       onMapCreated: (GoogleMapController controller) {
      //         _controller.complete(controller);
      //       },
      //     ),
      //   ),
      // ),
    ));
  }

  // Future<void> gps_fixed() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
