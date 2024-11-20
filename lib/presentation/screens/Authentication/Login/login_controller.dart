import '../../../../networking/api/index.dart';
import '../../../../utils/index.dart';
import '../../page_wrapper.dart';

class LoginController extends GetxController{
  final apiService = sl.get<ApiService>();
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

  Future<void> login() async {
    try{
      if(_formKey.currentState?.validate() ?? false) {
        await apiService.login(
            _usernameTextController.text, _passwordTextController.text);
        print('login sucessfully');
        HelperFunctions.showMessage('Login successfully', 1);
        await Future.delayed(const Duration(seconds: 3));
        HelperFunctions.navigateToHomePage();
      }
    } catch (e) {
      HelperFunctions.showMessage(e.toString().replaceFirst('Exception: ', ''), 2);
    }
  }

  void _navigateHome() {
    HelperFunctions.navigateToScreen(screen: PageWrapper());
  }
}