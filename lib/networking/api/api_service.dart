import 'package:travel_guide_app/models/index.dart';

abstract class ApiService {
  Future<List<Destination>> getFestivalDestination([String? province]);
  Future<List<Destination>> getRecommendationDestination([String? province]);
  Future<List<Destination>> getFavoriteDestinations();
  Future<List<Tour>> getTours();
  Future<Destination?> getDestinationById(int id);
}