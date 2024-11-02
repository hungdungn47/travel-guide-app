import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HelperFunctions {
  static void navigateToScreen({required Widget screen, Object? arguments}) {
    if(arguments != null) {
      Get.to(() => screen, arguments: arguments);
    } else {
    Get.to(() => screen);
    }
  }
}