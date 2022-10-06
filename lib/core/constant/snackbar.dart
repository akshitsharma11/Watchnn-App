import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KSnackbar {
  static errorSnackbar({
    String? title,
    String? subtitle,
  }) {
    Get.snackbar(
      title!,
      subtitle!,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
    );
  }

  static successSnackbar({
    String? title,
    String? subtitle,
  }) {
    Get.snackbar(
      title!,
      subtitle!,
      icon: const Icon(
        Icons.check,
        color: Colors.white,
      ),
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
    );
  }
}
