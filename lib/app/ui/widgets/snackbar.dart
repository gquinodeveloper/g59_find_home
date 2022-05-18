import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g59_find_home/app/core/theme/app_theme.dart';
import 'package:get/get.dart';

class Snackbar {
  static void show({
    required String title,
    required String message,
    int typeMessage = 0,
    bool isPositionTop = true,
  }) {
    Color? colorSnackBar = Colors.white;
    switch (typeMessage) {
      case 0: //Success
        colorSnackBar = AppTheme.cyan;
        break;
      case 1: //Error
        colorSnackBar = Colors.red;
        break;
      case 2: //information
        colorSnackBar = Colors.blue[300];
        break;
      default:
    }

    Get.snackbar(
      title,
      message,
      backgroundColor: colorSnackBar,
      colorText: Colors.white,
      snackPosition: isPositionTop ? SnackPosition.TOP : SnackPosition.BOTTOM,
      margin: EdgeInsets.only(top: 50.h, left: 15.0, right: 15.0),
      duration: const Duration(seconds: 5),
    );
  }
}
