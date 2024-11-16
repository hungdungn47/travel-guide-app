import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_guide_app/presentation/screens/Authentication/Login/login_state.dart';
import 'package:travel_guide_app/presentation/screens/Home/home.dart';
import 'package:travel_guide_app/presentation/screens/page_wrapper.dart';
import 'package:travel_guide_app/utils/helper_functions.dart';

class LoginController extends Cubit<LoginState> {
  LoginController() : super(const LoginState()) {
    _init();
  }

  late TextEditingController _usernameTextController;
  late GlobalKey<FormState> _formKey;
  late TextEditingController _passwordTextController;

  void _init() {
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