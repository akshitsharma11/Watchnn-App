import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:watchn/core/exceptions/route_exception.dart';
import 'package:watchn/view/screen/auth/forgotOTP/scren/confirmation.dart';
import 'package:watchn/view/screen/auth/forgotPass/screen/forgot_pass.dart';
import 'package:watchn/view/screen/auth/login/screen/login_screen.dart';
import 'package:watchn/view/screen/auth/resetPass/screen/reset_password.dart';
import 'package:watchn/view/screen/auth/signUp/screen/confor.dart';
import 'package:watchn/view/screen/auth/signUp/screen/sign_up_screen.dart';
import 'package:watchn/view/screen/home/screen/allow_contact/screen/allow_contact.dart';
import 'package:watchn/view/screen/home/screen/allow_contact/screen/home.dart';
import 'package:watchn/view/screen/home/screen/allow_contact/screen/live_video_screen.dart';
import 'package:watchn/view/screen/home/screen/allow_contact/screen/review.dart';
import 'package:watchn/view/screen/home/screen/dashboard.dart';
import 'package:watchn/view/screen/splash_screen.dart';

class AppRouter {
  static const String splash = 'Splash';
  static const String signUpScreen = 'Sign Up';
  static const String dashBoard = 'Dash Board';
  static const String login = 'Login';
  static const String home = 'Home';
  static const String forgotpass = 'Forgot Password';
  static const String confirmation = 'Confirmation';
  static const String confir = 'Confir';
  static const String resetpassword = 'Reset Password';
  static const String allowcontact = 'Allow Contact';
  static const String livevideo = 'Live Video';
  static const String review = 'Review';
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return PageTransition(
            child: const SplashScreen(), type: PageTransitionType.leftToRight);
      case signUpScreen:
        return PageTransition(
            child: const SignUp(), type: PageTransitionType.leftToRight);
      case login:
        return PageTransition(
            child: const LoginScreen(), type: PageTransitionType.leftToRight);
      case forgotpass:
        return PageTransition(
            child: const ForgotPass(), type: PageTransitionType.leftToRight);
      case confirmation:
        return PageTransition(
            child: Confirmation(), type: PageTransitionType.leftToRight);
      case resetpassword:
        return PageTransition(
            child: const ResetPassword(), type: PageTransitionType.leftToRight);
      case confir:
        return PageTransition(
            child: Confir(), type: PageTransitionType.leftToRight);
      case home:
        return PageTransition(
            child: const Home(), type: PageTransitionType.leftToRight);
      case allowcontact:
        return PageTransition(
            child: const AllowContact(), type: PageTransitionType.leftToRight);
      case livevideo:
        return PageTransition(
            child: const LiveVideo(), type: PageTransitionType.leftToRight);
      case review:
        return PageTransition(
            child: const ReivewScreen(), type: PageTransitionType.leftToRight);
      case dashBoard:
        return PageTransition(
          child: DashBoard(),
          type: PageTransitionType.leftToRight,
        );

      default:
        throw const RouteException('Route not found!');
    }
  }
}
