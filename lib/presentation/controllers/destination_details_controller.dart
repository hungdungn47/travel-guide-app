import 'package:get/get.dart';
import 'package:travel_guide_app/models/index.dart';
import 'package:travel_guide_app/presentation/controllers/favorite_destinations_controller.dart';
import '../../networking/api/index.dart';
import '../../utils/index.dart';

class DestinationDetailsController extends GetxController {
  final apiService = sl.get<ApiService>();
  final FavoriteDestinationsController favoriteDestinationsController = Get.put(FavoriteDestinationsController());
  Rx<Destination?> destination = Rx<Destination?>(null);
  RxBool isFavorite = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void changeDestination(Destination newDestination) {
    destination.value = newDestination;
  }

  Future<Destination?> fetchDestinations(String id) async {
    return apiService.getDestinationById(id);
  }

  void like() {
    favoriteDestinationsController.addFavoriteDestination(destination.value!);
  }

  void unlike() {
    favoriteDestinationsController.removeFavoriteDestination(destination.value!);
  }

  Future<void> fetchData(String id) async {
    Destination? destination = await fetchDestinations(id);
    changeDestination(destination!);
    isFavorite.value = favoriteDestinationsController.isFavorite(destination);
    print('Is favorite: ${isFavorite.value}');
  }
}