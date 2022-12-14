import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watchn/core/router/app_router.dart';
import 'package:watchn/view/screen/splash_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return ScreenUtilInit(
                designSize: const Size(412, 896),
                minTextAdapt: true,
                builder: (context, widget) {
                  return const MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: SplashScreen(),
                    onGenerateRoute: AppRouter.onGenerateRoute,
                  );
                });
          },
        );
      },
    );
  }
}
