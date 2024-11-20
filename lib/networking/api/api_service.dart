import 'package:travel_guide_app/models/index.dart';

import '../../presentation/screens/HotelRestaurant/hotel.dart';

abstract class ApiService {
  Future<List<Festival>> getFestivalDestination([String? province]);
  Future<List<Destination>> getRecommendationDestination([String? province]);
  Future<List<Destination>> getFavoriteDestinations();
  Future<List<Destination>> getAllDestinations();
  Future<List<Destination>> getDestinationsByKeyword(String keyword);
  Future<List<String>> getKeywordHotel(String prompt, String destinationId);
  Future<List<String>> getKeyword(String prompt);
  Future<List<Destination>> filterDestinations({String? type, String? city, String? ratingRange});
  Future<void> editUsername(String firstName, String lastName);
  Future<String> getUsername();
  Future<List<Festival>> fetchFestival();
  Future<List<Tour>> getTours();
  Future<Destination?> getDestinationById(String id);
  Future<List<Hotel>> fetchHotels(String destinationId);
  Future<dynamic> login(String username, String password);
  Future<Map<String, dynamic>> register(String username, String password, String email);
}