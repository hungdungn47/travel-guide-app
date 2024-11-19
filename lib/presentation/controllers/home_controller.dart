import 'package:get/get.dart';
import 'package:travel_guide_app/networking/api/api_service.dart';

import '../../models/index.dart';
import '../../utils/index.dart';

class HomeController extends GetxController {
  final apiService = sl.get<ApiService>();

  var destinationOverview = <Festival>[].obs;
  var destinationRecommendation = <Destination>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDestinations();
  }

  Future<void> fetchDestinations() async {
    try {
      final destinationsOverview = await apiService.getFestivalDestination();
      final destinationsRecommendation = await apiService.getRecommendationDestination();
      changeDestinationOverview(destinationsOverview);
      changeDestinationRecommendation(destinationsRecommendation);
    } catch (e) {
      print("Error fetching destinations: $e");
    }
  }

  void changeDestinationOverview(List<Festival> destinations) {
    destinationOverview.assignAll(destinations);
  }

  void changeDestinationRecommendation(List<Destination> destinations) {
    destinationRecommendation.assignAll(destinations);
  }
}
