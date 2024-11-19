import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/helper_functions.dart';
import '../../page_wrapper.dart';

class LoginController extends GetxController{
  late TextEditingController _usernameTextController;
  late GlobalKey<FormState> _formKey;
  late TextEditingController _passwordTextController;

  @override
  void onInit() {
    super.onInit();

    _usernameTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  TextEditingController get passwordTextController => _passwordTextController;

  TextEditingController get usernameTextController => _usernameTextController;


  GlobalKey<FormState> get formKey => _formKey;

  String? validateUsername(String? value) {
    if(value == null || value.isEmpty) {
      return 'Username must not be empty';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if(value == null || value.isEmpty) {
      return 'Password must not be empty';
    } else if(!_checkCredentials()) {
      return 'Wrong username or password';
    }
    return null;
  }

  bool _checkCredentials() {
    return true;
  }

  void login() {
    if(_formKey.currentState!.validate()) {
      _navigateHome();
    }
  }

  void _navigateHome() {
    HelperFunctions.navigateToScreen(screen: PageWrapper());
  }
}