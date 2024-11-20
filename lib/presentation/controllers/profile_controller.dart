import 'package:get/get.dart';
import 'package:travel_guide_app/networking/api/api_service.dart';
import 'package:travel_guide_app/utils/sl.dart';

class ProfilePageController extends GetxController {
  final apiService = sl.get<ApiService>();

  var name = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getUsername();
  }

  Future<void> getUsername() async {
    try {
      final username = await apiService.getUsername();
      _changeUsername(username);
    } catch (e) {
      print("Error fetching username: $e");
    }
  }

  void _changeUsername(String username) {
    name.value = username;
  }

  Future<void> editUsername(String firstName, String lastName) async {
    try {
      await apiService.editUsername(firstName, lastName);
      await getUsername();
    } catch (e) {
      print("Error editing username: $e");
    }
  }
}