import 'package:travel_guide_app/models/index.dart';

abstract class ApiService {
  Future<List<Festival>> getFestivalDestination([String? province]);
  Future<List<Destination>> getRecommendationDestination([String? province]);
  Future<List<Destination>> getFavoriteDestinations();
  Future<List<Destination>> getAllDestinations();
  Future<List<Destination>> getDestinationsByKeyword(String keyword);
  Future<List<String>> getKeyword(String prompt);
  Future<List<Destination>> filterDestinations({String? type, String? city, String? ratingRange});
  Future<void> editUsername(String firstName, String lastName);
  Future<String> getUsername();
  Future<List<Festival>> fetchFestival();
  Future<List<Tour>> getTours();
  Future<Destination?> getDestinationById(String id);
}