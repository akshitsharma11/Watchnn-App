import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:platform_device_id/platform_device_id.dart';
import 'package:watchn/core/api/api.dart';
import 'package:watchn/model/auth_model/login_model.dart';

import '../core/constant/local_key.dart';
import '../data/data_providers/data_provider.dart';

class AuthRepository {
  static Future<String> userLogin({String? email, String? password}) async {
    String? deviceId = await PlatformDeviceId.getDeviceId;
    final data = await http.post(
      Uri.parse(Api.baseurlLocal + Api.userlogin),
      body: {
        "user_email": email,
        "password": password,
        "playerID": deviceId ?? "",
        "deviceOS": Platform.isIOS ? "IOS" : "ANDROID"
      },
    );

    return data.body;
  }

  static loginWithGoogle() async {
    try {
      firebaseAuth.UserCredential user = await signInWithGoogle();
      firebaseAuth.User? firebaseUser = user.user;
      if (firebaseUser != null) {
        String? deviceId = await PlatformDeviceId.getDeviceId;
        final data = await http.post(
          Uri.parse(Api.baseurlLocal + Api.userloginwithUID),
          body: {
            "uid": firebaseUser.uid,
            "playerID": deviceId ?? "",
            "deviceOS": Platform.isIOS ? "IOS" : "ANDROID"
          },
        );
        print('INTO THE IF ${data.body}');

        return data.body;
      }
    } catch (e) {
      print(e);
      print("GOGGLE SININ ERROR");
    }
  }

  static CreateAcWithGoogle() async {
    try {
      firebaseAuth.UserCredential user = await signInWithGoogle();
      firebaseAuth.User? firebaseUser = user.user;
      if (firebaseUser != null) {
        String? deviceId = await PlatformDeviceId.getDeviceId;
        final data = await http.post(
          Uri.parse(Api.baseurlLocal + Api.userRegisterwithUID),
          body: {
            "user_email": firebaseUser.email,
            "uid": firebaseUser.uid,
            "playerID": deviceId ?? "",
            "deviceOS": Platform.isIOS ? "IOS" : "ANDROID"
          },
        );
        return data.body;
      }
    } catch (e) {
      print(e);
      print("GOGGLE SININ ERROR");
    }
  }

  static loginWithFacebook() async {
    // try {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    print('credein===${loginResult.accessToken}');
    print('credein===${loginResult.message}');
    print('credein===${loginResult.status}');

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    print('credein===${userCredential.user}');
    if (userCredential.user != null) {
      String? deviceId = await PlatformDeviceId.getDeviceId;
      final data = await http.post(
        Uri.parse(Api.baseurlLocal + Api.userloginwithUID),
        body: {
          "user_email": userCredential.user!.email,
          "uid": userCredential.user!.uid,
          "playerID": deviceId ?? "",
          "deviceOS": Platform.isIOS ? "IOS" : "ANDROID"
        },
      );
      print('INTO THE IF ${data.body}');

      return data.body;
    }
    // } catch (e) {
    //   print(e);
    //   print("FACEBOOK SIGNING ERROR");
    // }
  }

  static CreateAcWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      if (userCredential != null) {
        String? deviceId = await PlatformDeviceId.getDeviceId;
        final data = await http.post(
          Uri.parse(Api.baseurlLocal + Api.userRegisterwithUID),
          body: {
            "user_email": userCredential.user!.email,
            "uid": userCredential.user!.uid,
            "playerID": deviceId ?? "",
            "deviceOS": Platform.isIOS ? "IOS" : "ANDROID"
          },
        );
        return data.body;
      }
    } catch (e) {
      print(e);
      print("FACEBOOK SIGNUP ERROR");
    }
  }

  static Future<firebaseAuth.UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = firebaseAuth.GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the firebaseAuth.UserCredential
      return await firebaseAuth.FirebaseAuth.instance
          .signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  //sign out
  static Future<int> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      MyHydratedStorage().remove(LocalStorageKeys.userAuthentication);
      return 1;
    } catch (e) {
      print(e);
      return 0;
    }
  }

  static Future userRegister({
    String? phone,
    String? email,
    String? password,
    String? name,
    String? password_confirmation,
  }) async {
    List name = email!.split("@");
    String? deviceId = await PlatformDeviceId.getDeviceId;
    final data = await http.post(
      Uri.parse(Api.baseurlLocal + Api.userregister),
      body: {
        "user_email": email,
        "password": password,
        "name": name[0],
        "playerID": deviceId ?? "",
        "deviceOS": Platform.isIOS ? "IOS" : "ANDROID"
      },
    );
    print('respons${data.body}');
    return data.body;
  }

  static Future emailRegister({String? email}) async {
    final data = await http.post(
        Uri.parse(Api.baseurlLocal + Api.emailRegister),
        body: {"user_email": email});
    return data.body;
  }

  static Future forgotPassword({String? email}) async {
    final data = await http.post(
        Uri.parse(Api.baseurlLocal + Api.forgotPassword),
        body: {"user_email": email});
    return data.body;
  }

  static Future updatePassword({String? email, String? newPassword}) async {
    final data = await http.post(
        Uri.parse(Api.baseurlLocal + Api.updatePassword),
        body: {"user_email": email, "newPassword": newPassword});
    return data.body;
  }

  static Future<String> getUserProfile() async {
    LoginModel? dataModel = await MyHydratedStorage().getUser();
    Map<String, String>? data = {};
    Map<String, String>? userHeader = {
      'x-access-token': dataModel!.xAccessToken.toString(),
      "Content-type": "application/json",
      "Accept": "application/json"
    };
    final data123 = await http.post(
        Uri.parse(Api.baseurlLocal + Api.getUserProfile),
        headers: userHeader,
        body: data);
    print('USER PROFILE ----->  ${data123.body}');
    return data123.body;
  }
}
