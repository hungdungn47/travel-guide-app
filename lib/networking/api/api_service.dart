import 'package:travel_guide_app/models/index.dart';

abstract class ApiService {
  Future<List<Festival>> getFestivalDestination([String? province]);
  Future<List<Destination>> getRecommendationDestination([String? province]);
  Future<List<Destination>> getFavoriteDestinations();
  Future<List<Festival>> fetchFestival();
  Future<List<Tour>> getTours();
  Future<Destination?> getDestinationById(String id);
}