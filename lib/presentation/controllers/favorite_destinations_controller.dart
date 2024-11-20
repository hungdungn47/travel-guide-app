import 'dart:ffi';

import 'package:get/get.dart';
import 'package:travel_guide_app/models/index.dart';
import '../../networking/api/index.dart';
import '../../utils/index.dart';

class FavoriteDestinationsController extends GetxController {
  final apiService = sl.get<ApiService>();
  var favoriteDestinations = <Destination>[].obs;
  var isViewModeCarousel = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDestinations();
  }

  Future<void> fetchDestinations() async {
    try {
      final destinations = await apiService.getFavoriteDestinations();
      changeFavoriteDestinations(destinations);
    } catch (e) {
      print("Error fetching destinations: $e");
    }
  }

  void changeFavoriteDestinations(List<Destination> destinations) {
    favoriteDestinations.assignAll(destinations);
  }

  void toggleViewMode() {
    isViewModeCarousel.value = !(isViewModeCarousel.value);
  }
}