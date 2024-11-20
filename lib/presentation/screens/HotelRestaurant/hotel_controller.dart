import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../networking/api/api_service.dart';
import '../../../utils/sl.dart';
import 'hotel.dart';

class HotelController extends GetxController {
  var hotelLoading = true.obs;
  var hotelIsRecommending = true.obs;
  var hotelIsDone = true.obs;
  var hotels = <Hotel>[].obs;
  var hotelCurrentSearchPrompt = ''.obs;
  var hotelCurrentIndex = 0.obs;

  late ScrollController _sc;

  final apiService = sl.get<ApiService>();

  final String destinationId;
  HotelController({required this.destinationId});

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  void onInit() async {
    super.onInit();

    _sc = ScrollController();
    _sc.addListener(() async {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        if(hotelIsRecommending.value && !hotelIsDone.value) {
          await _addToHotelLists();
        }
      }
    });

    await getRecommendationLists();
  }

  ScrollController getScrollController() {
    return _sc;
  }

  Future<void> _addToHotelLists() async {
    if (!hotelLoading.value) {
      hotelLoading.value = !hotelLoading.value;
    }

    List<Hotel> hotelsToAdd = await _search(hotelCurrentSearchPrompt.value, 0);
    List<Hotel> currentHotels = [];

    currentHotels.addAll(hotels);

    for (Hotel hotel in hotelsToAdd) {
      currentHotels.add(hotel);
    }

    for(int i = hotels.length; i < currentHotels.length; i++) {
      listKey.currentState!
          .insertItem(i, duration: const Duration(milliseconds: 500));
    }


        hotelCurrentIndex.value = currentHotels.length;
        hotels.assignAll(currentHotels);
        hotelLoading.value = false;
        hotelIsRecommending.value = false;
  }

  Future<void> updateHotelLists(String prompt) async {
    for(int i = 0; i < hotels.length; i++) {
      listKey.currentState!.removeItem(0, (context, animation) => Container(),
          duration: Duration.zero);
    }

    if (!hotelLoading.value) {
      hotelLoading.value = true;
      hotels.clear();
    }

    List<Hotel> updatedHotels = await _search(prompt, 0);

    for(int i = 0; i < updatedHotels.length; i++) {
      listKey.currentState!
          .insertItem(i, duration: const Duration(milliseconds: 500));
    }

        hotelCurrentIndex.value = updatedHotels.length;
        hotelIsRecommending.value = false;
        hotelCurrentSearchPrompt.value = prompt;
        hotelLoading.value = false;
        hotels.assignAll(updatedHotels);
  }

  Future<List<String>> getSuggestion(String prompt) async {
    List<String> suggestions = ['This', 'shit', 'is', 'so', 'cool', 'WTF'];
    return suggestions;
  }

  Future<void> getRecommendationLists() async {
    if (!hotelLoading.value) {
      hotelLoading.value = true;
      hotels.clear();
    }
    // Only for demonstration
    List<Hotel> recommendations = await _search("Recommendation", 0);
    for(int i = 0; i < recommendations.length; i++) {
      listKey.currentState!
          .insertItem(i, duration: const Duration(milliseconds: 500));
    }
    hotels.assignAll(recommendations);
    hotelLoading.value = false;
  }

  Future<List<Hotel>> _search(String prompt, int startIndex) async {
    List<Hotel> hotels = await apiService.fetchHotels(destinationId);
    return hotels;
  }
}
