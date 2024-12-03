import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_guide_app/networking/api/api_service.dart';
import 'package:travel_guide_app/presentation/screens/Profile/user_profile.dart';
import 'package:travel_guide_app/utils/sl.dart';

class ProfilePageController extends GetxController {
  final apiService = sl.get<ApiService>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var name = ''.obs;
  var isEditing = false.obs;

  @override
  void onInit() {
    super.onInit();
    getUsername();
  }

  GlobalKey<FormState> get formKey => _formKey;

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

  String? validateUsername(String? value) {
    if(value == null || value.isEmpty) {
      return 'Username must not be empty';
    }
    return null;
  }

  Future<void> editUsername(String firstName, String lastName, BuildContext context) async {
    try {
      if(_formKey.currentState?.validate() ?? false) {
        isEditing.value = false;
        await apiService.editUsername(firstName, lastName);
        await getUsername();
        showSnackBar(context, "Username changed successfully");
      }
    } catch (e) {
      print("Error editing username: $e");
    }
  }
}