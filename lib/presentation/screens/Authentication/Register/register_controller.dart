import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../networking/api/index.dart';
import '../../../../utils/index.dart';

class RegisterController extends GetxController {
  final apiService = sl.get<ApiService>();
  late GlobalKey<FormState> _formKey;
  late TextEditingController _usernameTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _passwordConfirmationTextController;
  late TextEditingController _emailTextController;

  @override
  void onInit() {
    super.onInit();
    _usernameTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _passwordConfirmationTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  TextEditingController get passwordTextController => _passwordTextController;

  TextEditingController get usernameTextController => _usernameTextController;

  TextEditingController get emailTextController => _emailTextController;

  TextEditingController get passwordConfirmationTextController =>
      _passwordConfirmationTextController;

  GlobalKey<FormState> get formKey => _formKey;

  String? validateUsername(String? value) {
    if(value == null || value.isEmpty) {
      return 'Username must not be empty';
    } else if (!_checkAvailability()) {
      return 'This username has already been used';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if(value == null || value.isEmpty) {
      return 'Password must not be empty';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if(value == null || value.isEmpty) {
      return 'Email must not be empty';
    }
    return null;
  }

  String? validateConfirmationPassword(String? value) {
    if(value == null || value.isEmpty) {
      return 'Password confirmation must not be empty';
    } else if (passwordConfirmationTextController.text != passwordTextController.text) {
      return 'Password confirmation does not match';
    }
    return null;
  }

  bool _checkAvailability() {
    return true;
  }

  Future<void> register() async {
    try {
      if(_formKey.currentState?.validate() ?? false) {
        Map<String, dynamic> r = await apiService.register(
            _usernameTextController.text, _passwordTextController.text,
            _emailTextController.text);
        if (r['code'] == 200) {
          HelperFunctions.showMessage(
              r['message'] ?? 'Register successfully', 1);
          await Future.delayed(const Duration(seconds: 3));
          HelperFunctions.navigateToLoginPage();
        } else {
          HelperFunctions.showMessage(r['message'] ?? 'Error occur', 2);
        }
      }
    } catch (e) {
      print(e);
    }
    // if(_formKey.currentState!.validate()) {
    //   _navigateLogin();
    // }
  }

  void _navigateLogin() {}
}