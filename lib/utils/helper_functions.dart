import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class HelperFunctions {
  static void navigateToScreen({required Widget screen, Object? arguments}) {
    if(arguments != null) {
      Get.to(() => screen, arguments: arguments);
    } else {
    Get.to(() => screen);
    }
  }
}