import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/constant/const.dart';
import 'package:watchn/gen/assets.gen.dart';
import 'package:watchn/view/screen/home/screen/all_incidents/screen/all_incidents.dart';
import 'package:watchn/view/screen/home/screen/allow_contact/screen/home.dart';
import 'package:watchn/view/screen/home/screen/feed_home/screen/feed_home.dart';
import 'package:watchn/view/screen/home/screen/profile/screen/profile_screen.dart';

class DashBoard extends StatefulWidget {
  final int selectedIndex;
  DashBoard({
    Key? key,
    this.selectedIndex = 0,
  }) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late ValueNotifier<int> _selectedIndex;

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    FeedHome(),
    AllIncidents(),
    ProfileScreen(),
  ];
  @override
  void initState() {
    _selectedIndex = ValueNotifier<int>(widget.selectedIndex);
    super.initState();
  }

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (BuildContext context, int value, Widget? child) {
          return WillPopScope(
            onWillPop: () {
              showDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  content: Text(
                    "Are you sure you want to exit?",
                    style: TextStyle(color: Const.kBlue, fontSize: 17.sp),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text(
                          "no",
                          style: TextStyle(color: Const.kBlue),
                        )),
                    TextButton(
                        onPressed: () {
                          exit(0);
                        },
                        child: Text(
                          "yes",
                          style: TextStyle(color: Const.kBlue),
                        )),
                  ],
                ),
              );
              return Future<bool>(() => true);
            },
            child: Scaffold(
              backgroundColor: Const.kBackground,
              bottomNavigationBar: SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(top: 7.r),
                  child: BottomNavigationBar(
                    backgroundColor: Const.kBackground,
                    fixedColor: Const.kBackground,
                    elevation: 0.1,
                    showSelectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: value,
                    onTap: _onItemTapped,
                    items: [
                      BottomNavigationBarItem(
                          icon: Assets.icon.allowcontact
                              .svg(height: 30.h, width: 25.w),
                          label: '',
                          activeIcon: Assets.icon.allowcontactbold
                              .svg(height: 30.h, width: 25.w)),
                      BottomNavigationBarItem(
                          icon: Assets.icon.home.svg(height: 30.h, width: 25.w),
                          label: "",
                          activeIcon: Assets.icon.homebold
                              .svg(height: 30.h, width: 25.w)),
                      BottomNavigationBarItem(
                          icon: Assets.icon.warning
                              .svg(height: 30.h, width: 25.w),
                          label: "",
                          backgroundColor: Const.kBackground,
                          activeIcon:
                              Assets.icon.alert.svg(height: 30.h, width: 25.w)),
                      BottomNavigationBarItem(
                          icon: Assets.icon.profile
                              .svg(height: 30.h, width: 25.w),
                          label: "",
                          activeIcon: Assets.icon.profilebold
                              .svg(height: 30.h, width: 25.w))
                    ],
                  ),
                ),
              ),
              body: _widgetOptions.elementAt(value),
            ),
          );
        });
  }
}
