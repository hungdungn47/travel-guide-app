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

  void addFavoriteDestination(Destination destination) {
    if(isFavorite(destination)) {
      return;
    }
    favoriteDestinations.add(destination);
    Get.snackbar(
      'Loved destination!', '${destination.name} has been added to your favorite list!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      margin: const EdgeInsets.only(bottom: 80),
      duration: const Duration(milliseconds: 800),
      overlayBlur: 2,
      // dismissDirection: DismissDirection.down
    );
  }

  void removeFavoriteDestination(Destination destinationToRemove) {
    if(!isFavorite(destinationToRemove)) {
      return;
    }
    favoriteDestinations.removeWhere((destination) => destination.id == destinationToRemove.id);
    Get.snackbar(
      'Unliked destination!', '${destinationToRemove.name} has been removed from your favorite list!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      overlayBlur: 2,
      duration: const Duration(milliseconds: 800),
      margin: const EdgeInsets.only(bottom: 80),
      // dismissDirection: DismissDirection.down
    );
  }

  bool isFavorite(Destination destination) {
    return favoriteDestinations.map((destination) => destination.id).contains(destination.id);
  }

  void toggleViewMode() {
    isViewModeCarousel.value = !(isViewModeCarousel.value);
  }
}