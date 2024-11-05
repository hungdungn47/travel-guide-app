import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_guide_app/presentation/screens/Authentication/Register/register_state.dart';

class RegisterController extends Cubit<RegisterState> {
  RegisterController() : super(const RegisterState()) {
    _init();
  }

  late GlobalKey<FormState> _formKey;
  late TextEditingController _usernameTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _passwordConfirmationTextController;
  late TextEditingController _emailTextController;

  void _init() {
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

  void register() {
    if(_formKey.currentState!.validate()) {
      _navigateLogin();
    }
  }

  void _navigateLogin() {}
}