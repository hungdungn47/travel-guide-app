import 'package:get/get.dart';
import 'package:travel_guide_app/models/index.dart';
import '../../networking/api/index.dart';
import '../../utils/index.dart';

class DestinationController extends GetxController {
  var destinationName = ''.obs;
  void changeDestination(String newDestination) {
    destinationName.value = newDestination;
  }
}