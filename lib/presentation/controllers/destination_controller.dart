import 'package:get/get.dart';

class DestinationController extends GetxController {
  var destinationName = ''.obs;
  void changeDestination(String newDestination) {
    destinationName.value = newDestination;
  }
}