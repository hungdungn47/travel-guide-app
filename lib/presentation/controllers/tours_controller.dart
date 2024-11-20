import 'package:get/get.dart';
import 'package:travel_guide_app/models/index.dart';
import '../../networking/api/index.dart';
import '../../utils/index.dart';

class ToursController extends GetxController {
  final apiService = sl.get<ApiService>();
  var tours = <Tour>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTours();
  }

  Future<void> fetchTours() async {
    try {
      changeTours(await apiService.getTours());
    } catch (e) {
      print("Error fetching tours: $e");
    }
  }

  void changeTours(List<Tour> newTours) {
    tours.assignAll(newTours);
  }
}