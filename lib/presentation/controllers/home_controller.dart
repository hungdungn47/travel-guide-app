import 'package:get/get.dart';
import 'package:travel_guide_app/networking/api/api_service.dart';

import '../../models/index.dart';
import '../../utils/index.dart';

class HomeController extends GetxController {
  final apiService = sl.get<ApiService>();

  var destinationOverview = <Destination>[].obs;
  var destinationRecommendation = <Destination>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDestinations();
  }

  Future<void> fetchDestinations() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      final destinationsOverview = await apiService.getFestivalDestination();
      final destinationsRecommendation = await apiService.getRecommendationDestination();
      changeDestinationOverview(destinationsOverview);
      changeDestinationRecommendation(destinationsRecommendation);
    } catch (e) {
      print("Error fetching destinations: $e");
    }
  }

  void changeDestinationOverview(List<Destination> destinations) {
    destinationOverview.assignAll(destinations);
  }

  void changeDestinationRecommendation(List<Destination> destinations) {
    destinationRecommendation.assignAll(destinations);
  }
}
