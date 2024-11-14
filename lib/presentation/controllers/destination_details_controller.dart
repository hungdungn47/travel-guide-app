import 'package:get/get.dart';
import 'package:travel_guide_app/models/index.dart';
import '../../networking/api/index.dart';
import '../../utils/index.dart';

class DestinationDetailsController extends GetxController {
  final apiService = sl.get<ApiService>();
  Rx<Destination?> destination = Rx<Destination?>(null);

  void changeDestination(Destination newDestination) {
    destination.value = newDestination;
  }

  Future<Destination?> fetchDestinations(int id) async {
    await Future.delayed(const Duration(seconds: 5));
    return apiService.getDestinationById(id);
  }

  Future<void> fetchData(int id) async {
    Destination? destination = await fetchDestinations(id);
    changeDestination(destination!);
  }
}