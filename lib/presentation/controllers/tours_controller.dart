import 'package:get/get.dart';
import 'package:travel_guide_app/models/index.dart';
import '../../networking/api/index.dart';
import '../../utils/index.dart';

class ToursController extends GetxController {
  final apiService = sl.get<ApiService>();
  var tours = <Tour>[].obs;
  var showingTours = <Tour>[].obs;

  var selectedRange = ''.obs;

  void updatePriceRange(String range) {
    selectedRange.value = range;
    showingTours.value = filterTours(tours);
  }

  @override
  void onInit() {
    super.onInit();
    fetchTours();
  }

  List<Tour> filterTours(List<Tour> tours) {
    switch (selectedRange.value) {
      case '50-150':
        return tours.where((tour) => tour.price >= 50 && tour.price <= 150).toList();
      case '150-250':
        return tours.where((tour) => tour.price > 150 && tour.price <= 250).toList();
      case '250-450':
        return tours.where((tour) => tour.price > 250 && tour.price <= 450).toList();
      case '450+':
        return tours.where((tour) => tour.price > 450).toList();
      default:
        return tours; // Return all tours if no range is selected.
    }
  }

  Future<void> fetchTours() async {
    try {
      changeTours(await apiService.getTours());
    } catch (e) {
      print("Error fetching tours: $e");
    }
  }

  Future<void> fetchToursOfDestination(String destination) async {
    print('Fetching tours of ${destination}');
    try {
      List<Tour> newTours = await apiService.getTours();
      print('Tours of ${destination}: ');
      newTours.forEach((tour) {
        print(tour.destination);
      });
      newTours.removeWhere((tour) => tour.destination != destination);
      changeTours(newTours);
    } catch (e) {
      print("Error fetching tours: $e");
    }
  }

  void changeTours(List<Tour> newTours) {
    tours.assignAll(newTours);
    showingTours.assignAll(newTours);
  }
}