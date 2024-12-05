import 'package:get/get.dart';
import 'package:travel_guide_app/models/index.dart';
import 'package:travel_guide_app/networking/api/api_service.dart';
import 'package:travel_guide_app/utils/sl.dart';

class SearchPageController extends GetxController{
  final apiService = sl.get<ApiService>();

  var searchResults = <Destination>[].obs;
  var selectedDestinationType = ''.obs;
  var selectedCity = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSearchResults();
  }

  void changeDestinationType(String type) {
    selectedDestinationType.value = type;
    filterSearchResults();
  }

  void changeCity(String city) {
    selectedCity.value = city;
    filterSearchResults();
  }

  Future<void> fetchSearchResults() async {
    try {
      print('Fetching search Results');
      final destinations = await apiService.getAllDestinations();
      print('All destinations: ${destinations}');
      changeSearchResults(destinations);
    } catch (e) {
      print("Error fetching search results: $e");
    }
  }

  void changeSearchResults(List<Destination> destinations) {
    searchResults.clear();
    searchResults.assignAll(destinations);
  }

  Future<void> filterSearchResults({String? type, String? city, String? ratingRange}) async {
    try {
      print('Type ${selectedDestinationType.value}');
      print('City ${selectedCity.value}');
      final destinations = await apiService.filterDestinations(
          type: selectedDestinationType.value != '' ? selectedDestinationType.value : null,
          city: selectedCity.value != '' && selectedCity.value != 'Any city' ? selectedCity.value : null);
      changeSearchResults(destinations);
    } catch (e) {
      print("Error fetching search results: $e");
    }
  }

  Future<List<String>> getKeyword(String keyword) async {
    try {
      final destinations = await apiService.getKeyword(keyword);
      return destinations;
    } catch (e) {
      print("Error fetching search results: $e");
      return [];
    }
  }

  Future<void> getDestinationsByKeyword(String keyword) async {
    try {
      final destinations = await apiService.getDestinationsByKeyword(keyword);
      changeSearchResults(destinations);
    } catch (e) {
      print("Error fetching search results: $e");
    }
  }
}