import 'package:travel_guide_app/models/index.dart';

import '../../presentation/screens/HotelRestaurant/hotel.dart';

abstract class ApiService {
  Future<List<Festival>> getFestivalDestination([String? province]);
  Future<List<Destination>> getRecommendationDestination([String? province]);
  Future<List<Destination>> getFavoriteDestinations();
  Future<List<Festival>> fetchFestival();
  Future<List<Tour>> getTours();
  Future<Destination?> getDestinationById(String id);
  Future<List<Hotel>> fetchHotels(String destinationId);
  Future<dynamic> login(String username, String password);
  Future<Map<String, dynamic>> register(String username, String password, String email);
}