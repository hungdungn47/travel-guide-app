import 'package:get/get.dart';
import 'package:travel_guide_app/models/index.dart';
import '../../networking/api/index.dart';
import '../../utils/index.dart';

class DestinationDetailsController extends GetxController {
  final apiService = sl.get<ApiService>();
  Rx<Destination?> destination = Rx<Destination?>(null);
  RxBool isFavorite = false.obs;

  void changeDestination(Destination newDestination) {
    destination.value = newDestination;
  }

  Future<Destination?> fetchDestinations(String id) async {
    return apiService.getDestinationById(id);
  }

  Future<void> fetchData(String id) async {
    Destination? destination = await fetchDestinations(id);
    changeDestination(destination!);
  }
}