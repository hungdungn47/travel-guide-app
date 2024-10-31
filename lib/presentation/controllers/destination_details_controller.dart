import 'package:get/get.dart';

class DestinationDetailsController extends GetxController {
  var currentDestination = 'Tràng An'.obs;
  void changeDestination(String newDestination) {
    currentDestination.value = newDestination;
  }
}