import 'package:get/get.dart';
import 'package:travel_guide_app/presentation/screens/HotelRestaurant/hotel.dart';

class HotelState {
    var hotelLoading = true.obs;
    var hotelIsRecommending = true.obs;
    var hotelIsDone = true.obs;
    var hotels = <Hotel>[].obs;
    var hotelCurrentSearchPrompt = ''.obs;
    var currentIndex = 0.obs;
}